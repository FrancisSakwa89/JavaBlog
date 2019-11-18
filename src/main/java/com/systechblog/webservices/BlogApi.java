package com.systechblog.webservices;

import com.systechblog.beans.blog.BlogBeanI;
import org.jboss.logging.Logger;

import javax.ejb.EJB;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import java.sql.SQLException;

@Path("blog")
public class BlogApi {

    private CustomResponse customResponse = new CustomResponse();

    @EJB
    BlogBeanI blogBeanI;

    @Inject
    private transient Logger logger;


    @GET
    @Path("/list")
    @Produces(MediaType.APPLICATION_JSON)

    public Response list() throws SQLException {
        customResponse.setData(blogBeanI.readAll());
        customResponse.setMessage("All posts in the library");
        customResponse.setStatus(true);

        logger.info("Message: " + customResponse.getMessage() + " data" + customResponse.getData() + customResponse.isStatus());
        return Response.ok().entity(customResponse).build();
    }
}
