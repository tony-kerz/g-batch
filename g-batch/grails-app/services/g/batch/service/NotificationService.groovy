package g.batch.service

class NotificationService {
	def notify(List<String> notifyTargets, String message) {
		for (String target: notifyTargets)
		{
			log.info "notifying target=[${target}] with message=[${message}]..."
		}
	}
}
