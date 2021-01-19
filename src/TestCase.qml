import QtQuick 2.9
import QtQuick.Layouts 1.3
import QtQuick.Window 2.2
import QtQuick.Controls 2.3
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0
import QtTest 1.2

//module "QtTest" plugin "qmltestplugin" not found
TestCase {
	name: "MathTests"

	function test_math() {
		compare(2 + 2, 4, "2 + 2 = 4")
	}

	function test_fail() {
		compare(2 + 2, 5, "2 + 2 = 5")
	}
}