package com.flash_editor.filter;

import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * Created by xiaobo.cao on 2016/2/23.
 */

public class UrlFilter extends OncePerRequestFilter {


    @Override
    protected void doFilterInternal(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, FilterChain filterChain) throws ServletException, IOException {
        if (httpServletRequest.getRequestURI().endsWith("login.jsp")){
            Map<String,String> map = new HashMap<String, String>();
            String refererUrl = httpServletRequest.getHeader("referer");
            if (refererUrl.endsWith(".jsp")) {
                refererUrl = refererUrl.substring(refererUrl.lastIndexOf("/") + 1, refererUrl.length());
                httpServletRequest.getSession().setAttribute("loginRefererUrl", refererUrl);
            }else if (refererUrl.endsWith("findAllPosts")){
                refererUrl = refererUrl.substring(refererUrl.lastIndexOf("/") + 1, refererUrl.length());
                httpServletRequest.getSession().setAttribute("loginRefererUrl", refererUrl);
            }else if (refererUrl.endsWith("loadProject")){
                refererUrl = refererUrl.substring(refererUrl.lastIndexOf("/") + 1, refererUrl.length());
                httpServletRequest.getSession().setAttribute("loginRefererUrl", refererUrl);
            }

        }
        if (httpServletRequest.getRequestURI().endsWith("logout")){
            Map<String,String> map = new HashMap<String, String>();
            String refererUrl = httpServletRequest.getHeader("referer");
            if (refererUrl.endsWith(".jsp")) {
                refererUrl = refererUrl.substring(refererUrl.lastIndexOf("/") + 1, refererUrl.length());
                httpServletRequest.getSession().setAttribute("logoutRefererUrl", refererUrl);
            }else if (refererUrl.endsWith("findAllPosts")){
                refererUrl = refererUrl.substring(refererUrl.lastIndexOf("/") + 1, refererUrl.length());
                httpServletRequest.getSession().setAttribute("logoutRefererUrl", refererUrl);
            }else if (refererUrl.endsWith("loadProject")){
                refererUrl = refererUrl.substring(refererUrl.lastIndexOf("/") + 1, refererUrl.length());
                httpServletRequest.getSession().setAttribute("loginRefererUrl", refererUrl);
            }
        }
        filterChain.doFilter(httpServletRequest,httpServletResponse);
    }
}
