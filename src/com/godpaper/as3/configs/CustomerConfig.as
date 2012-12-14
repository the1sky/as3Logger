package com.godpaper.as3.configs{
	import com.godpaper.as3.configs.LoggerConfig;
	import mx.logging.LogEventLevel;
	
	public class CustomerConfig{
		public var includeLevel:Boolean;
		public var includeDate:Boolean;
		public var includeCategory:Boolean;
		public var includeTime:Boolean;
		public var includeMemory:Boolean;
		public var fieldSeparator:String;		
		public var filters:Array;
		public var level:int;	
		
		public function CustomerConfig():void{	
			includeLevel = LoggerConfig.includeLevel;
			includeDate = LoggerConfig.includeDate;
			includeCategory = LoggerConfig.includeCategory;
			includeTime = LoggerConfig.includeTime;
			includeMemory = LoggerConfig.includeMemory;
			fieldSeparator = LoggerConfig.fieldSeparator;		
			filters = LoggerConfig.filters;
			level = LoggerConfig.level;			
		}
	}
}