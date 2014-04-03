package com.atc.siterra.bup.service;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class MetadataService {
	EntityManagerFactory factory = Persistence.createEntityManagerFactory("SQLServer2");
	EntityManager em = null;
	
}
