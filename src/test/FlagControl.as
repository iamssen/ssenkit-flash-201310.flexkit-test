package test {
import ssen.devkit.Should;

public class FlagControl {
	private var flag0:uint=1 << 0;
	private var flag1:uint=1 << 1;
	private var flag2:uint=1 << 2;
	private var flag3:uint=1 << 3;

	[test]
	public function flagging():void {
		var flags:uint=0;

		flags|=flag0;
		flags|=flag2;

		// | 둘 중 하나만 맞아도
		// & 둘 다 맞아야 
		// ^ 둘 중 하나만 맞아야

		// test single
		Should.notEqual(flags & flag0, 0);
		Should.equal(flags & flag1, 0);
		Should.notEqual(flags & flag2, 0);
		Should.equal(flags & flag3, 0);

		// test or 
		Should.notEqual(flags & (flag0 | flag2), 0);
		Should.notEqual(flags & (flag0 | flag1), 0);
		Should.notEqual(flags & (flag0 | flag3), 0);
		Should.notEqual(flags & (flag1 | flag2), 0);
		Should.notEqual(flags & (flag3 | flag2), 0);
		Should.equal(flags & (flag1 | flag3), 0);

		// test and
		Should.equal(flags & (flag0 | flag2), flags);
		Should.notEqual(flags & (flag0 | flag1), flags);
		Should.notEqual(flags & (flag1 | flag2), flags);
		Should.notEqual(flags & (flag1 | flag3), flags);

		// clear
		flags&=~(flag0 | flag2);
		Should.equal(flags & flag0, 0);
		Should.equal(flags & flag2, 0);
		Should.equal(flags & (flag0 | flag2), 0);
	}

	[test]
	public function stateFlagTest():void {
		var flag:StateModel=new StateModel;
		flag.add(flag0 | flag2);

		Should.equal(flag.test(flag0), true);
		Should.equal(flag.test(flag1), false);
		Should.equal(flag.test(flag2), true);
		Should.equal(flag.test(flag3), false);
		Should.equal(flag.test(flag0 | flag2), true);
		Should.equal(flag.test(flag0 | flag3), true);

		flag.clear();

		Should.equal(flag.test(flag0), false);
		Should.equal(flag.test(flag1), false);
		Should.equal(flag.test(flag2), false);
		Should.equal(flag.test(flag3), false);
	}

}
}

class StateModel {
	public static const A:uint=1 << 0;
	public static const B:uint=1 << 1;
	public static const C:uint=1 << 2;

	private var flags:uint=0;

	public function remove(mask:uint):void {
		flags&=~mask;
	}

	public function clear():void {
		flags=0;
	}

	public function add(mask:uint):void {
		flags|=mask;
	}

	public function test(mask:uint):Boolean {
		return (flags & mask) !== 0;
	}
}

class CheckModel {
	public static const A:uint=1 << 0;
	public static const B:uint=1 << 1;
	public static const C:uint=1 << 2;
	public static const D:uint=1 << 3;

	private var flags:uint=0;

	public function complete(mask:uint):void {
		flags|=mask;
	}

	public function clear():void {
		flags=0;
	}

	public function test():Boolean {
		var c:uint=A | B | C | D;
		return (c & flags) === c;
	}
}
