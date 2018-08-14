package br.com.fzlbpms;

import java.io.IOException;
import java.util.Date;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.*;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class AccessLogFilter implements Filter {
    public void doFilter(ServletRequest req, ServletResponse res,
                         FilterChain chain) throws IOException, ServletException {

        HttpServletRequest request = (HttpServletRequest) req;
        HttpServletResponse response = (HttpServletResponse) res;
        
        // Get the IP address of client machine.
        String ipAddress = request.getRemoteAddr();

        System.out.println(">>>>>>>>>>");
        System.out.println("[AccessLogFilter] "+request.getUserPrincipal());
        System.out.println("[AccessLogFilter] request.isUserInRole - o-builder-forms:"+request.isUserInRole("o-builder-forms"));
        
        System.out.println("[AccessLogFilter] IP " + ipAddress + ", Time " + new Date().toString());
        String path = request.getRequestURI();
        System.out.println("[AccessLogFilter] url= "+path);
        if(path.contains("builder")){
            System.out.println("[AccessLogFilter] *Liberado apenas para o-builder-forms role");
            //there are not redirect because orbeon web.xml has secutiry-contraint to this case
        }
        if(path.endsWith("summary") && !request.isUserInRole("o-builder-forms")){
             System.out.println("[AccessLogFilter] *Liberado apenas para o-builder-forms role");
             //orbeonw web.xml do not have security-conxtraint to this case
             //its because lacks of jee url-pattern no allow this "endWitch" use case             
             response.sendRedirect("/orbeon/fr/orbeon/builder/new");
             return;             
        }         
        System.out.println("<<<<<<<<<<");

        
        //if (path.startsWith("/specialpath/")) {
        //    chain.doFilter(request, response); // Just continue chain.
        //} else {
        //    // Do your business stuff here for all paths other than /specialpath.
            // }
        
        chain.doFilter(req, res);
    }

    public void init(FilterConfig config) throws ServletException {       
        // Get init parameter
        String testParam = config.getInitParameter("param1");

        // Print the init parameter
        System.out.println("Init Param Name : " + testParam);
    }

    public void destroy() {
        // add code to release any resource
    }
}
