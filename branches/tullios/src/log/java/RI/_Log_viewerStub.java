package RI;


/**
* RI/_Log_viewerStub.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from src/log/java/log_viewer.idl
* mercoledì 28 ottobre 2009 16.59.02 CET
*/

public class _Log_viewerStub extends org.omg.CORBA.portable.ObjectImpl implements RI.Log_viewer
{

  public void setEnvironment (String[] Drivers, int segmentsNumber, short RaceLaps)
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("setEnvironment", false);
                RI.StringSequenceHelper.write ($out, Drivers);
                $out.write_long (segmentsNumber);
                $out.write_short (RaceLaps);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                setEnvironment (Drivers, segmentsNumber, RaceLaps        );
            } finally {
                _releaseReply ($in);
            }
  } // setEnvironment

  public void updateLog (short Driver_ID, int Segment, float Speed, boolean box)
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("updateLog", false);
                $out.write_short (Driver_ID);
                $out.write_long (Segment);
                $out.write_float (Speed);
                $out.write_boolean (box);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                updateLog (Driver_ID, Segment, Speed, box        );
            } finally {
                _releaseReply ($in);
            }
  } // updateLog

  public void endRace (short Driver_ID, short reason)
  {
            org.omg.CORBA.portable.InputStream $in = null;
            try {
                org.omg.CORBA.portable.OutputStream $out = _request ("endRace", false);
                $out.write_short (Driver_ID);
                $out.write_short (reason);
                $in = _invoke ($out);
                return;
            } catch (org.omg.CORBA.portable.ApplicationException $ex) {
                $in = $ex.getInputStream ();
                String _id = $ex.getId ();
                throw new org.omg.CORBA.MARSHAL (_id);
            } catch (org.omg.CORBA.portable.RemarshalException $rm) {
                endRace (Driver_ID, reason        );
            } finally {
                _releaseReply ($in);
            }
  } // endRace

  // Type-specific CORBA::Object operations
  private static String[] __ids = {
    "IDL:RI/Log_viewer:1.0"};

  public String[] _ids ()
  {
    return (String[])__ids.clone ();
  }

  private void readObject (java.io.ObjectInputStream s) throws java.io.IOException
  {
     String str = s.readUTF ();
     String[] args = null;
     java.util.Properties props = null;
     org.omg.CORBA.Object obj = org.omg.CORBA.ORB.init (args, props).string_to_object (str);
     org.omg.CORBA.portable.Delegate delegate = ((org.omg.CORBA.portable.ObjectImpl) obj)._get_delegate ();
     _set_delegate (delegate);
  }

  private void writeObject (java.io.ObjectOutputStream s) throws java.io.IOException
  {
     String[] args = null;
     java.util.Properties props = null;
     String str = org.omg.CORBA.ORB.init (args, props).object_to_string (this);
     s.writeUTF (str);
  }
} // class _Log_viewerStub
