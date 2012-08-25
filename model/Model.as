﻿package model 
{
	import util.NumberChecks;
	import flash.events.*;
	
	public class Model extends EventDispatcher
	{
		
		var operatorsArray:Array = new Array();
		
		public var objective:int = 1;
		
		private var range:int = 7;
		
		public var maxItemsInEquation:int = 12;
		
		// can be fine-tuned to increase level
		private var threshold:Number = 0.2; 
		
		private var plusMultiplier: int = 7;
		private var minusMultiplier: int = 7;
		private var multiplicationMultiplier: int = 4;
		private var divisionMultiplier:int = 2;
		
		private var minObjective:int = 12;
		private var objectiveRange:int = 30;
		
		// gameplay
		
		public var noOfLives:int = 3;
		public var noOfBusts:int = 0;
		
		private var calculator:Calculator = new Calculator();
		
		public static var NEW_GAME:String = "newGame";
		
		public static var SCORE_PENALTY:String = "scorePenalty"; 
		public static var SCORE_BONUS:String = "scoreBonus"; 
		public static var UPDATE_EQUATION:String = "updateEquation";
		
		public static var BUST:String = "bust";
		public static var GREAT:String = "great"; 
		
		
		public function Model() 
		{

		}
		
		public function init()
		{			
			dispatchEvent(new Event(Model.NEW_GAME));
			dispatchEvent(new Event(Model.UPDATE_EQUATION));
		}
		
		private function setOperatorsArray()
		{
			for (var i:int = 0; i < plusMultiplier;i++)				operatorsArray.push("+");
			for (var j:int = 0; j < minusMultiplier;j++) 			operatorsArray.push("-");
			for (var k:int = 0; k < multiplicationMultiplier;k++) 	operatorsArray.push("*");
			for (var l:int = 0; l < divisionMultiplier;l++) 		operatorsArray.push("/");
		}
		
		
		public function getRandomElement():CalcElement
		{
			/*
			if ( Math.random() > threshold ) return new CalcElement(1, getRandomNumber());
			else 							 return new CalcElement(0, getRandomOperator());
			*/
			
			//dummy
			return new CalcElement();
		}
		
		private function getRandomOperator():String
		{
			return operatorsArray[ Math.floor(Math.random() * operatorsArray.length) ];
		}
		
		private function getRandomNumber():int
		{
			return Math.ceil(Math.random() * range);
		}
		
		public function getCurrentObjective():int
		{
			return objective;
		}
		
		public function getNewObjective():int
		{
			objective = this.minObjective + Math.ceil(Math.random() * objectiveRange);
			return objective;
		}
		
		/*
		public function addToEquation( element )
		{
			
		}
		*/
		
		public function bust()
		{
			dispatchEvent(new Event(Model.BUST));
		}
	}

}