
/**
* Log_viewerHolder.java .
* Generated by the IDL-to-Java compiler (portable), version "3.2"
* from log_viewer.idl
* lunedì 11 maggio 2009 18.13.35 CEST
*/

public final class Log_viewerHolder implements org.omg.CORBA.portable.Streamable
{
  public Log_viewer value = null;

  public Log_viewerHolder ()
  {
  }

  public Log_viewerHolder (Log_viewer initialValue)
  {
    value = initialValue;
  }

  public void _read (org.omg.CORBA.portable.InputStream i)
  {
    value = Log_viewerHelper.read (i);
  }

  public void _write (org.omg.CORBA.portable.OutputStream o)
  {
    Log_viewerHelper.write (o, value);
  }

  public org.omg.CORBA.TypeCode _type ()
  {
    return Log_viewerHelper.type ();
  }

}
