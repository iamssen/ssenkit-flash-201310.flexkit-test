package test.grid {
import ssen.flexkit.components.grid.LinedDataGrid;

public class TestDataGrid extends LinedDataGrid {
	[SkinPart(required="false")]
	public var testGridElement:TestGridElement;

	/** @inheritDoc */
	override protected function partAdded(partName:String, instance:Object):void {
		super.partAdded(partName, instance);

		if (instance === testGridElement || instance === grid) {
			if (testGridElement && grid) {
				testGridElement.dataGrid=this;
			}
		}
	}
}
}
