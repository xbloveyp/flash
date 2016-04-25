package com.flash_editor.filter;

import com.flash_editor.domain.User;
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
            if (refererUrl!=null) {
                if (refererUrl.endsWith(".jsp")) {
                    if (refererUrl.endsWith("discuss.jsp")){
                        httpServletRequest.getSession().setAttribute("loginRefererUrl", "flash/findAllEssencePosts/1");
                    }else {
                        refererUrl = refererUrl.substring(refererUrl.lastIndexOf("/") + 1, refererUrl.length());
                        httpServletRequest.getSession().setAttribute("loginRefererUrl", refererUrl);
                    }
                }
//                else if (refererUrl.endsWith("findAllPosts")) {
//                    refererUrl = refererUrl.substring(refererUrl.lastIndexOf("/") + 1, refererUrl.length());
//                    httpServletRequest.getSession().setAttribute("loginRefererUrl", "flash/"+refererUrl);
//                } else if (refererUrl.endsWith("loadProject")) {
//                    refererUrl = refererUrl.substring(refererUrl.lastIndexOf("/") + 1, refererUrl.length());
//                    httpServletRequest.getSession().setAttribute("loginRefererUrl","flash/"+refererUrl);
//                }
            }

        }
        if (httpServletRequest.getRequestURI().endsWith("logout")) {
            Map<String, String> map = new HashMap<String, String>();
            String refererUrl = httpServletRequest.getHeader("referer");
            if (refererUrl != null) {
                if (refererUrl.endsWith(".jsp")) {
                    if (refererUrl.endsWith("edtior.jsp")){
                        httpServletRequest.getSession().setAttribute("logoutRefererUrl", "workSpace.jsp");
                    }else {
                        if (refererUrl.endsWith("discuss.jsp")){
                            httpServletRequest.getSession().setAttribute("logoutRefererUrl", "flash/findAllEssencePosts/1");
                        }else {
                            refererUrl = refererUrl.substring(refererUrl.lastIndexOf("/") + 1, refererUrl.length());
                            httpServletRequest.getSession().setAttribute("logoutRefererUrl", refererUrl);
                        }
                    }
                }
//                else if (refererUrl.endsWith("findAllPosts")) {
//                    refererUrl = refererUrl.substring(refererUrl.lastIndexOf("/") + 1, refererUrl.length());
//                    httpServletRequest.getSession().setAttribute("logoutRefererUrl", "flash/"+refererUrl);
//                } else if (refererUrl.endsWith("loadProject")) {
//                    refererUrl = refererUrl.substring(refererUrl.lastIndexOf("/") + 1, refererUrl.length());
//                    httpServletRequest.getSession().setAttribute("logoutRefererUrl", "flash/"+refererUrl);
//                }
            }
        }
        if (httpServletRequest.getRequestURI().endsWith("edtior.jsp")){
            User user = (User) httpServletRequest.getSession().getAttribute("user");
            if (user==null){
                httpServletResponse.sendRedirect("index.jsp");
            }
        }
        filterChain.doFilter(httpServletRequest,httpServletResponse);
    }
}
