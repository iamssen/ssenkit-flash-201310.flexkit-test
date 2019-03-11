package test.viewmodels {
import flash.events.EventDispatcher;

import mx.collections.ArrayCollection;
import mx.collections.IList;
import mx.events.PropertyChangeEvent;

import ssen.common.MathUtils;
import ssen.common.StringUtils;

public class EditableGridRowModel extends EventDispatcher {
	//---------------------------------------------
	// toggle
	//---------------------------------------------
	/** toggle */
	public var toggle:Boolean;

	public function setToggle(value:Boolean):void {
		var oldValue:Boolean=toggle;
		toggle=value;
		if (hasEventListener(PropertyChangeEvent.PROPERTY_CHANGE)) {
			dispatchEvent(PropertyChangeEvent.createUpdateEvent(this, "toggle", oldValue, toggle));
		}
	}

	[Bindable]
	public var text:String;

	[Bindable]
	public var number:Number;

	[Bindable]
	public var numeric:int;

	public var minimum:int;

	public var maximum:int;

	[Bindable]
	public var dropdownlist:String;

	[Bindable]
	public var dropdownlistList:IList;

	[Bindable]
	public var date:Date;

	[Bindable]
	public var label:String;

	public function EditableGridRowModel() {
		toggle=MathUtils.rand(0, 1) > 0;
		text="Sample Text";
		number=MathUtils.rand(10, 3000);
		numeric=MathUtils.rand(10, 3000);
		minimum=MathUtils.rand(-1000, 10);
		maximum=MathUtils.rand(100, 3000);
		dropdownlistList=getList();
		dropdownlist=dropdownlistList.getItemAt(MathUtils.rand(0, dropdownlistList.length - 1)) as String;
		date=new Date;
		label="BUTTON " + MathUtils.rand(0, 100);
	}

	private function getList():IList {
		return new ArrayCollection(["AAA", "BBB", "CCC", "DDD", "EEE", "FFF", "GGG", "HHH", "III", "JJJ", "KKK"]);
	}

	override public function toString():String {
		return StringUtils.formatToString('[EditableGridRowModel toggle="{1}" text="{2}" number="{3}" numeric="{4}" dropdownlist="{5}" date="{6}"]', null, toggle, text, number,
										  numeric, dropdownlist, date, label);
	}
}
}
