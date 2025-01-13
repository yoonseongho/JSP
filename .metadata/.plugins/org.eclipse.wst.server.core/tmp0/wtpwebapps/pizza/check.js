function insertCheck() {
	if (document.form1.saleno.value == "") {
		alert("매출전표번호가 입력되지 않았습니다!");
		form1.saleno.focus();
		return false;
	}

	if (document.form1.scode.value == "") {
		alert("지점코드가 입력되지 않았습니다!");
		form1.scode.focus();
		return false;
	}

	if (document.form1.saledate.value == "") {
		alert("판매날짜가 입력되지 않았습니다!");
		form1.saledate.focus();
		return false;
	}

	if (document.form1.pcode.value == "") {
		alert("피자코드가 입력되지 않았습니다!");
		form1.pcode.focus();
		return false;
	}

	if (document.form1.amount.value == "") {
		alert("판매수량이 입력되지 않았습니다!");
		form1.amount.focus();
		return false;
	}

	alert("매출전표가 정상적으로 등록 되었습니다!");
	return true;
}

function resetCheck() {
	alert("정보를 지우고 처음부터 다시 입력 합니다!");
}