package g.batch.control

import g.batch.domain.BatchControl
import g.batch.domain.BatchResult

import org.springframework.util.Assert

class ResultController {

	def index() {
		log.debug "params=${params}"
		List<BatchControl> ctls = BatchControl.list(sort: 'name')
		[ctls: ctls]
	}

	def read() {
		log.debug "params=${params}"
		Assert.notNull(params.id, "id required")

		def results = BatchResult.list(batchName: params.id)

		[results: results]
	}
}
