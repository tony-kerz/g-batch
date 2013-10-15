package g.batch.service

import g.batch.domain.BatchResult

class BatchService {

	def execute(String batchName, Map<String, Object> args) {
		runEm(args, batchName)
	}

	def runEm(Map<String, Object> args, String batchName) {
		int modulo = 20
		double random = Math.random()
		int randomInt = (random * 100) % modulo
		int sleepSec = randomInt
		int create = randomInt
		
		log.info "sleeping for [${sleepSec}] seconds and creating [${create}] result records..."
		Thread.sleep(sleepSec * 1000)

		Date beforeThisRun = new Date()

		for (int i = 0; i < create; i++) {
			BatchResult rslt = new BatchResult(batchName: batchName, result: "my result was [${Math.random()}]")
			rslt.save()
		}

		log.info "deleting all prior batch-results..."
		//BatchResult.where{ (batchName = '${batchName}') and (dateCreated < beforeThisRun) }.deleteAll()
		BatchResult.executeUpdate("delete BatchResult b where batchName = :batchName and dateCreated < :targetDate",
				[batchName: batchName, targetDate: beforeThisRun])
	}
}
