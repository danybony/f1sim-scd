import java.io.BufferedReader;
import java.io.FileReader;
import org.omg.CORBA.*;
import org.omg.CosNaming.*;
import org.omg.PortableServer.*;
import org.omg.PortableServer.POA;
import RI.*;


/**
 *
 * @author  daniele
 */
public class Log_main extends javax.swing.JFrame {

   // private Log_viewerImpl log_viewerImpl;

   // private ORB orb;

    static String args[];
    private static final String IORFILE = "/home/daniele/SCD/f1-export_new/txt/ior.txt";



    /**
    * @param args the command line arguments
    */
    public static void main(String args[]) {
        

        try{
          // create and initialize the ORB
          ORB orb = ORB.init(args,null);

          // get reference to rootpoa & activate the POAManager
          POA rootpoa = POAHelper.narrow(orb.resolve_initial_references("RootPOA"));
          rootpoa.the_POAManager().activate();

          // create servant
          Log_viewerImpl log_viewerImpl = new Log_viewerImpl();
          log_viewerImpl.setORB(orb);

          LogFrame frame = new LogFrame(log_viewerImpl);
          frame.setVisible(true);

          log_viewerImpl.setFrame(frame);

          // get object reference from the servant
          org.omg.CORBA.Object ref = rootpoa.servant_to_reference(log_viewerImpl);
          Log_viewer href = Log_viewerHelper.narrow(ref);

          //read stringified Registry to file
          FileReader fr = new FileReader(IORFILE);
          BufferedReader br = new BufferedReader(fr);
          String remoteRegistryIOR = br.readLine();

          //get the romote Registry
          org.omg.CORBA.Object ncobj = orb.string_to_object(remoteRegistryIOR);
          NamingContext rootNC = NamingContextHelper.narrow(ncobj);
          frame.println("Obtained Name Service reference.");

          NameComponent[] name = new NameComponent[1];
          name[0] = new NameComponent("Logger","");

          try {

               rootNC.bind(name,href);


          } catch(org.omg.CORBA.UserException ue) {
            ue.printStackTrace();
            System.exit(-1);
          }

          frame.println("Logger Remote Inderface binded in Name Service");

          // wait for invocations from client
          frame.println("Logger ready and waiting ...");
          orb.run();
          
          //clean the Naming Context
          rootNC.unbind(name);
          frame.println("Logger Exiting ...");
      }

      catch (Exception e) {
        System.err.println("ERROR: " + e);

        e.printStackTrace(System.out);
      }

      System.out.println("Logger Exiting ...");

       
    }

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable;
    // End of variables declaration//GEN-END:variables


}