package g.batch.domain

import org.apache.commons.lang.builder.ReflectionToStringBuilder


class BatchControl {

	static constraints = {
		args nullable: true
		completed nullable: true
		dateCreated nullable: true
		initiated nullable: true
		lastUpdated nullable: true
		notify nullable: true
		requested nullable: true
		status nullable: true
	}

	String args
	Date completed
	Date dateCreated
	Date initiated
	Date lastUpdated
	String name
	String notify
	Date requested
	String status

	public String toString() {
		return ReflectionToStringBuilder.toString(this);
	}
}
