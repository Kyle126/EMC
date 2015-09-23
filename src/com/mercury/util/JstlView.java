package com.mercury.util;

import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.view.InternalResourceView;

public class JstlView extends InternalResourceView {

	@Override
	protected void renderMergedOutputModel(Map<String, Object> model,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// Expose the model object as request attributes.
	    exposeModelAsRequestAttributes(model, request);
		
		// Determine the path for the request dispatcher.
		String dispatcherPath = prepareForRendering(request, response);
		
		// Set original view being asked for as a request parameter
		String[] content = dispatcherPath.split("/");
		String path = "";
		if (content.length > 4) {
			path = "/";
			for (int i = 3; i < content.length - 1; i++) {
				path = content[i] + "/";
			}
		}
		request.setAttribute("content", path + dispatcherPath.substring(dispatcherPath.lastIndexOf("/") + 1));
		
		// Force everything to be template.jsp
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("/WEB-INF/pages/template.jsp");
		requestDispatcher.include(request, response);
	}

}