public class batchapexexampleschedular implements schedulable
{
    public void execute(schedulablecontext sch)
    {
        id jobid = database.executebatch(new batchapexexample());
        system.debug('jobid of batchapexexample in batchapexexampleschedular is == ' + jobid);
    }
}