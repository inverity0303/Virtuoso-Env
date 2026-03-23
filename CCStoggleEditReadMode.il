procedure(CCStoggleEditReadMode()
	case(geGetEditCellView()~>mode
		("a" geChangeEditMode("r"))
		("r" geChangeEditMode("a"))
		);case
);end procedure
