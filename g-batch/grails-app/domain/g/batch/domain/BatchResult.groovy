package g.batch.domain

import java.util.Date;

import org.apache.commons.lang.builder.ReflectionToStringBuilder

class BatchResult {	
	Date dateCreated
	String batchName
	String result

	static constraints = { }

	public String toString() {
		return ReflectionToStringBuilder.toString(this);
	}
}
