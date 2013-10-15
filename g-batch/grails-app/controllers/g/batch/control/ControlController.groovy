package g.batch.control

import g.batch.domain.BatchControl
import g.batch.service.ControlService

import org.springframework.util.Assert

class ControlController {
	ControlService controlService

	def index() {
		[controls: BatchControl.list()]
	}

	def request() {
		log.debug "params=${params}"
		Assert.notNull(params.name, "name parameter required")
		
		controlService.request(params.name, "me@them.com")
		
		redirect(action: 'index')
	}
}
