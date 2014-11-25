package com.phn.bean;

import java.util.HashSet;
import java.util.Set;

public class Types {

	private int id;
	private String name;
	private int countTopics = 0;
	private int countComments = 0;

	private Categorys typesCategory;

	private Set<Topics> typeTopics = new HashSet<Topics>();

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getCountTopics() {
		return countTopics;
	}

	public void setCountTopics(int countTopics) {
		this.countTopics = countTopics;
	}

	public Set<Topics> getTypeTopics() {
		return typeTopics;
	}

	public void setTypeTopics(Set<Topics> typeTopics) {
		this.typeTopics = typeTopics;
	}

	public Categorys getTypesCategory() {
		return typesCategory;
	}

	public void setTypesCategory(Categorys typesCategory) {
		this.typesCategory = typesCategory;
	}

	public int getCountComments() {
		return countComments;
	}

	public void setCountComments(int countComments) {
		this.countComments = countComments;
	}


}