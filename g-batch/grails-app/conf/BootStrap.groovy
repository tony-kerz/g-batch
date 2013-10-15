import g.batch.service.ControlService

class BootStrap {
	ControlService controlService

    def init = { servletContext ->
		
		controlService.initialize("all-modules")
		controlService.initialize("module-1")
		controlService.initialize("module-2")
    }
    def destroy = {
    }
}
