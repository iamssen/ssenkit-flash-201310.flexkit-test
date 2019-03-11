package test.viewmodels {
import flash.events.Event;
import flash.events.EventDispatcher;

import mx.collections.ArrayList;

import ssen.common.MathUtils;
import ssen.common.StringUtils;

public class MultiCategoryViewModel extends EventDispatcher {
	[Bindable]
	public var label:String="선택해 주세요";

	[Bindable]
	public var list1:ArrayList;

	[Bindable]
	public var list2:ArrayList;

	[Bindable]
	public var list3:ArrayList;

	//---------------------------------------------
	// list1SelectedIndex
	//---------------------------------------------
	private var _list1SelectedIndex:int;

	/** list1SelectedIndex */
	[Bindable(event="list1SelectedIndexChanged")]
	public function get list1SelectedIndex():int {
		return _list1SelectedIndex;
	}

	public function set list1SelectedIndex(value:int):void {
		_list1SelectedIndex=value;
		dispatchEvent(new Event("list1SelectedIndexChanged"));

		list2=generateList(list1.getItemAt(value).label);
		list2SelectedIndex=0;
	}

	//---------------------------------------------
	// list2SelectedIndex
	//---------------------------------------------
	private var _list2SelectedIndex:int;

	/** list2SelectedIndex */
	[Bindable(event="list2SelectedIndexChanged")]
	public function get list2SelectedIndex():int {
		return _list2SelectedIndex;
	}

	public function set list2SelectedIndex(value:int):void {
		_list2SelectedIndex=value;
		dispatchEvent(new Event("list2SelectedIndexChanged"));

		list3=generateList(list2.getItemAt(value).label);
		list3SelectedIndex=0;
	}

	//---------------------------------------------
	// list3SelectedIndex
	//---------------------------------------------
	private var _list3SelectedIndex:int;

	/** list3SelectedIndex */
	[Bindable(event="list3SelectedIndexChanged")]
	public function get list3SelectedIndex():int {
		return _list3SelectedIndex;
	}

	public function set list3SelectedIndex(value:int):void {
		_list3SelectedIndex=value;
		dispatchEvent(new Event("list3SelectedIndexChanged"));

		label=list3.getItemAt(value).label;
	}




	//==========================================================================================
	// utils
	//==========================================================================================
	public function MultiCategoryViewModel() {
		list1=generateList("Item");
		list1SelectedIndex=0;
	}

	public function generateList(label:String):ArrayList {
		var arr:Array=[];

		var f:int=-1;
		var fmax:int=MathUtils.rand(3, 6);
		while (++f < fmax) {
			arr.push({index: f, label: StringUtils.formatToString("{0} - {1}", label, f)});
		}

		return new ArrayList(arr);
	}
}
}
