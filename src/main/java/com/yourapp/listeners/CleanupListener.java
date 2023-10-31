package com.yourapp.listeners;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class CleanupListener implements ServletContextListener {
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        com.mysql.cj.jdbc.AbandonedConnectionCleanupThread.checkedShutdown();
    }

    @Override
    public void contextInitialized(ServletContextEvent sce) {
        // No action required here
    }
}
