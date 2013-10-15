package g.batch.service

import g.batch.domain.BatchControl

import org.springframework.util.StringUtils

class ControlService {

	BatchService batchService
	NotificationService notificationService

	def execute() {
		List<BatchControl> ctls = BatchControl.list()
		for (BatchControl ctl : ctls) {
			if (ctl.requested) {
				log.info "control-block=[${ctl.name}] requested, running batch..."
				ctl.initiated = new Date()
				ctl.save(flush: true)

				try {
					batchService.execute(ctl.name, convertToMap(ctl.args))

					log.info "batch completed, executing completion operations..."

					if (StringUtils.hasText(ctl.notify)) {
						String[] tokens = ctl.notify.split(",")
						List<String> targets = Arrays.asList(tokens)
						String msg = "batch=[${ctl.name}] completed..."
						log.info "notifying targets=${targets} with message=[${msg}]..."
						notificationService.notify(targets, msg)
						ctl.notify = null
					}
					ctl.status = null
				}
				catch (Throwable t) {
					log.error "encountered exception attempting to execute batch=[${ctl.name}]", t
					ctl.status = t.toString()
				}
				ctl.completed = new Date()
				ctl.requested = null
				ctl.save()
			}
		}
	}

	def request(String name, String notify) {
		log.info "request for batch=[${name}], notify=[${notify}]..."
		BatchControl ctl = BatchControl.findByName(name)
		if (!ctl) {
			throw new RuntimeException('batch-control for [${name}] required')
		}

		if (!ctl.requested) {
			ctl.requested = new Date()
		}		

		if (StringUtils.hasText(notify)) {
			if (StringUtils.hasText(ctl.notify)) {
				log.info "adding notify=[${notify}] to existing notify=[${ctl.notify}]..."
				ctl.notify = "${ctl.notify},${notify}"
			}
			else {
				ctl.notify = notify
			}
		}

		ctl.save()
	}

	def initialize(String name) {
		BatchControl ctl = BatchControl.findByName(name)

		if (!ctl) {
			log.info "batch-control for name=[${name}] doesn't exist creating..."
			ctl = new BatchControl(name: name)
			ctl.save()
		}
		else {
			log.info "batch-control=${ctl} already exists..."
		}
	}

	private Map<String, Object> convertToMap(String args) {
		// to-do
		null
	}
}

