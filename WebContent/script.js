function writeSave(){
	var wform =document.writeform;
	if(!wform.writer.value){
		alert("이름을 입력하시오");
		wform.writer.focus();
		return false;
	}
	if(!wform.subject.value){
		alert("제목을 입력하시오");
		wform.subject.focus();
		return false;
	}
	if(!wform.content.value){
		alert("내용을 입력하시오");
		wform.content.focus();
		return false;
	}
	if(!wform.passwd.value){
		alert("비밀번호를 입력하시오");
		wform.passwd.focus();
		return false;
	}
}