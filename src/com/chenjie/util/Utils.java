package com.chenjie.util;

import java.io.IOException;
import java.net.InetSocketAddress;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.mapred.JobClient;
import org.apache.hadoop.mapred.JobStatus;
public final class Utils {
	
	// set cluster job tracker
	public static String JOBTRACKER="chenjie-virtual-machine:9001";
	
	public static String HADOOP_HOST="chenjie-virtual-machine";
	
	public static int HADOOP_PORT=9001;
	
	public static long JOB_START_TIME=System.currentTimeMillis();
	
	public static Configuration conf;
	
	// get map and reduce progress
	public static float[] getMapReduceProgess(JobStatus jobStatus){
		float[] progress=new float[2];
		progress[0]=jobStatus.mapProgress();
		progress[1]=jobStatus.reduceProgress();
		return progress;
	}
	
	// get job status from configuration
	public static JobStatus getJobStatus(Configuration conf) throws IOException{
		JobStatus[] jobStatusAll=new JobClient(new InetSocketAddress(HADOOP_HOST, HADOOP_PORT), conf).getAllJobs();
	//	System.out.println("jobStatusAll length:"+jobStatusAll.length);
		JobStatus jobStatus=jobStatusAll[jobStatusAll.length-1];
		return jobStatus;

	}
	
	public static float[] getMapReduceProgess(Configuration conf) throws IOException{
		JobStatus jobStatus=getJobStatus(conf);
	//	System.out.println("job id:"+jobStatus.getJobID().getId());
		float[] progress=getMapReduceProgess(jobStatus);
		/*if(progress[0]==1.0){
			System.out.println("job id:"+jobStatus.getJobID().getId());
			long jobStartTime=jobStatus.getStartTime();
			System.out.println("Utils.JOB_START_TIME:"+Utils.JOB_START_TIME);
			if(jobStartTime<Utils.JOB_START_TIME){
				System.out.println("job start time:"+jobStartTime);
				progress=new float[2];
			}
		}*/
		return progress;
	}
	
	public static float[] getMapReduceProgess() throws IOException{
		return getMapReduceProgess(conf);
	}
}
