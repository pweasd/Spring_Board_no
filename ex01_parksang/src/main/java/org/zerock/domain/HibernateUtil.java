package org.zerock.domain;

import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.service.ServiceRegistry;

public class HibernateUtil {
	 private static SessionFactory sessionFactory;
	 static {
	 try {
	Configuration configuration = new Configuration();
	configuration.configure();
	ServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings
	 (configuration.getProperties()).build();
	sessionFactory = configuration.buildSessionFactory(serviceRegistry);
	 } catch (Throwable t) {
	 throw new ExceptionInInitializerError(t);
	 }
	 }
	 public static SessionFactory getSessionFactory() {
	 return sessionFactory;
	 }
	 public static void shutdown() {
	 getSessionFactory().close();
	 }


}
