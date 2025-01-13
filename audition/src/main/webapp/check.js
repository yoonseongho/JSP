function insertCheck() {
	if (document.form1.artist_id.value == "") {
		alert("참가번호가 입력되지 않았습니다!");
		form1.artist_id.focus();
		return false;
	}

	if (document.form1.artist_name.value == "") {
		alert("참가자명이 입력되지 않았습니다!");
		form1.artist_name.focus();
		return false;
	}

	if (document.form1.birth_y.value == "") {
	    alert("생년월일이 입력되지 않았습니다!");
	    document.form1.birth_y.focus();
	    return false;
	}

	if (document.form1.birth_m.value == "") {
	    alert("생년월일이 입력되지 않았습니다!");
	    document.form1.birth_m.focus();
	    return false;
	}

	if (document.form1.birth_d.value == "") {
	    alert("생년월일이 입력되지 않았습니다!");
	    document.form1.birth_d.focus();
	    return false;
	}

	if (document.form1.artist_gender.value == "") {
		alert("성별이 입력되지 않았습니다!");
		document.form1.artist_gender[0].focus();
		return false;
	}

	if (document.form1.talent.value == "") {
		alert("특기가 입력되지 않았습니다!");
		form1.talent.focus();
		return false;
	}

	if (document.form1.agency.value == "") {
		alert("소속사가 입력되지 않았습니다!");
		form1.agency.focus();
		return false;
	}
	
	alert("참가신청이 정상적으로 등록 되었습니다!");
	return true;
}

function resetCheck() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
}