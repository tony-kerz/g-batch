package g.batch.job

import g.batch.service.ControlService

class BatchJob {
	
	// http://grails-plugins.github.io/grails-quartz/guide/configuration.html
	def concurrent = false
	
	ControlService controlService
	 
	static triggers = {
		// http://grails-plugins.github.io/grails-quartz/guide/triggers.html
		simple startDelay:5000, repeatInterval: 5000, repeatCount: -1
	}

	def execute() {
		controlService.execute()		
	}
	
	private def executeBatch()
	{
		log.info "running batch..."
	}
}
