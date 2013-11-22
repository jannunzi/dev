package edu.neu.cs5200.model;

import com.mongodb.*;

public class Developer extends BasicDBObject {
	public String first;
	public String last;
	public double age;
	public String id;
	public Developer(){}
	public Developer(String f, String l, int a, String id) {
		setFirst(f);
		setLast(l);
		setAge(a);
		setId(id);
	}
	public Developer(String f, String l, int a) {
		this(f, l, a, null);
	}
	public Developer(DBObject dev) {
		setId(dev.get("_id").toString());
		setFirst((String)dev.get("first"));
		setLast((String)dev.get("last"));
		Object ageObj = dev.get("age");
		try {
			age = (Double)ageObj;
		} catch(Exception e) {
			try {
				age = (Integer)ageObj;
			} catch(Exception e2) {
				age = 0;
			}
		}
		setAge(age);
	}
	public String getFirst() {
		return getString("first");
	}
	public void setFirst(String first) {
		this.first = first;
		put("first", first);
	}
	public String getLast() {
		return getString("last");
	}
	public void setLast(String last) {
		this.last = last;
		put("last", last);
	}
	public int getAge() {
		return getInt("age");
	}
	public void setAge(double age) {
		this.age = age;
		put("age", age);
	}
	public String getId() {
		return getObjectId("_id").toString();
	}
	public void setId(String id) {
		if(id == null)
			return;
		this.id = id;
		org.bson.types.ObjectId idObj = new org.bson.types.ObjectId(id);
		put("_id", idObj);
	}
	public String toString() {
		return first + " " + last + " " + age + " " + id;
	}
}
