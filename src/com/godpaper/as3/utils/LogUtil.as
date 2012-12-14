package com.godpaper.as3.utils{
	import com.godpaper.as3.configs.CustomerConfig;
	
	import flash.utils.getQualifiedClassName;
	
	import mx.logging.ILogger;
	import mx.logging.Log;
	import mx.logging.LogEventLevel;
	import mx.logging.targets.TraceTarget;

	/**
	 * Use a simple utility method to retrieve the logger
	 * for a particular class, instead of passing
	 * in the qualified class name as a string.
	 *
	 * just like:(Declare Loggers as Static Constants)
	 * private static const LOG:ILogger = LogUtil.getLogger(MyClass);
	 *
	 * Format Log Statements Consistently:
	 * LOG.error("Something bad has happened: event={0}, message={1}", event.type, message);
	 *
	 * Parameterize Log Statements:
	 * LOG.error("Something bad has happened: event={0}, message={1}", event.type, message);
	 *
	 * Use Log Levels to Indicate Severity:
	 * LOG.error("The service has failed and no data is available.");
	 *
	 * Use Log Filters for Focus:
	 * target.filters = [ "my.important.package.MyClass" ];
	 * target.level = LogEventLevel.INFO;
	 *
	 * Include Categories to Show Class Names:
	 * target.includeCategory = true;
	 *
	 * More references:
	 * http://blogs.adobe.com/tomsugden/2009/08/
	 *
	 * @author Knight.zhou
	 */
	public class LogUtil{

		//Variables(should be only one instance!)
		private static var _traceTarget:TraceTarget=new TraceTarget();
		private static var _log:ILogger;

		/**
		 * With the utility method approach,
		 * the class name can be refactored
		 * without needing to edit the string.
		 * Here is an implementation for the LogUtil.getLogger() method:
		 *
		 * @param class category
		 * @return ILogger
		 *
		 */
		public static function getLogger(object:Object, config:CustomerConfig):ILogger{
			var traceTarget:TraceTarget = new TraceTarget();
			var className:String=getQualifiedClassName(object).replace("::", ".");
			
			Log.flush();
			
			config = ( config ) ? config : new CustomerConfig();							
			
			//Customize the Log
			traceTarget.includeLevel = config.includeLevel;
			traceTarget.includeDate = config.includeDate;
			traceTarget.includeCategory=config.includeCategory;
			traceTarget.includeTime = config.includeTime;
			traceTarget.includeMemory = config.includeMemory;
			traceTarget.fieldSeparator = config.fieldSeparator;
			traceTarget.filters = config.filters;
			traceTarget.level = config.level;
			
			config = null;			
			Log.addTarget(traceTarget);
			
			return Log.getLogger(className);
		}
		
		public static function log(object:Object, config:CustomerConfig=null, message:String="", ...rest):void{			
			_log = getLogger( object, config );
			_log.log( LogEventLevel.ALL, message, rest );				
		}
		
		public static function debug(object:Object, config:CustomerConfig=null, message:String="", ...rest):void{	
			_log = getLogger( object, config );					
			_log.debug( message, rest );			
		}
		
		public static function warn(object:Object, config:CustomerConfig=null, message:String="", ...rest):void{		
			_log = getLogger( object, config );
			_log.warn( message, rest );		
		}
		
		public static function fatal(object:Object, config:CustomerConfig=null, message:String="", ...rest):void{			
			_log = getLogger( object, config );
			_log.fatal( message, rest );		
		}
		
		public static function info(object:Object, config:CustomerConfig=null, message:String="", ...rest):void{
			_log = getLogger( object, config );
			_log.info( message, rest );	
		}
		
		public static function error(object:Object, config:CustomerConfig=null, message:String="", ...rest):void{
			_log = getLogger( object, config );
			_log.error( message, rest );	
		}
	}
}
