
/**
 *
 * @author daniele
 */

import org.omg.CORBA.*;
import org.omg.PortableServer.*;
import org.omg.PortableServer.POA;


public class Server {

  public static void main(String args[]) {
    try{
      // create and initialize the ORB
      ORB orb = ORB.init(args, null);

      // get reference to rootpoa & activate the POAManager
      POA rootpoa = POAHelper.narrow(orb.resolve_initial_references("RootPOA"));
      rootpoa.the_POAManager().activate();

      // create servant
      Log_viewerImpl log_viewerImpl = new Log_viewerImpl();
      log_viewerImpl.setORB(orb);

      // get object reference from the servant
      org.omg.CORBA.Object ref = rootpoa.servant_to_reference(log_viewerImpl);
      Log_viewer href = Log_viewerHelper.narrow(ref);

      System.out.println("HelloServer ready and waiting ...");

      String ior = orb.object_to_string(href);
      System.out.println(ior);

      // wait for invocations from clients
      orb.run();
    }

      catch (Exception e) {
        System.err.println("ERROR: " + e);
        e.printStackTrace(System.out);
      }

      System.out.println("HelloServer Exiting ...");

  }
}