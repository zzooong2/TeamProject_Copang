/* ============================== Category Middle ============================== */
let testValue = "";
document.getElementById("Detail_right_Contents1_Category_Style").addEventListener('change', function() {
	testValue = this.value;
	
	if(this.value === "IT·프로그래밍") {
		document.getElementById("Detail_right_middleCategory").style.display = 'none';
		document.getElementById("Detail_right_middleCategory1").style.display = 'flex'
		document.getElementById("Detail_right_middleCategory2").style.display = 'none'
		document.getElementById("Detail_right_middleCategory3").style.display = 'none'
		document.getElementById("Detail_right_middleCategory4").style.display = 'none'
		document.getElementById("Detail_right_middleCategory5").style.display = 'none'
	} else if (this.value === "디자인"){
		document.getElementById("Detail_right_middleCategory").style.display = 'none';
		document.getElementById("Detail_right_middleCategory1").style.display = 'none';
		document.getElementById("Detail_right_middleCategory2").style.display = 'flex';
		document.getElementById("Detail_right_middleCategory3").style.display = 'none';
		document.getElementById("Detail_right_middleCategory4").style.display = 'none';
		document.getElementById("Detail_right_middleCategory5").style.display = 'none';
	} else if (this.value === "영상·사진"){
		document.getElementById("Detail_right_middleCategory").style.display = 'none';
		document.getElementById("Detail_right_middleCategory1").style.display = 'none';
		document.getElementById("Detail_right_middleCategory2").style.display = 'none';
		document.getElementById("Detail_right_middleCategory3").style.display = 'flex';
		document.getElementById("Detail_right_middleCategory4").style.display = 'none';
		document.getElementById("Detail_right_middleCategory5").style.display = 'none';
	} else if (this.value === "마케팅"){
		document.getElementById("Detail_right_middleCategory").style.display = 'none';
		document.getElementById("Detail_right_middleCategory1").style.display = 'none';
		document.getElementById("Detail_right_middleCategory2").style.display = 'none';
		document.getElementById("Detail_right_middleCategory3").style.display = 'none';
		document.getElementById("Detail_right_middleCategory4").style.display = 'flex';
		document.getElementById("Detail_right_middleCategory5").style.display = 'none';
	} else if (this.value === "교육"){
		document.getElementById("Detail_right_middleCategory").style.display = 'none';
		document.getElementById("Detail_right_middleCategory1").style.display = 'none';
		document.getElementById("Detail_right_middleCategory2").style.display = 'none';
		document.getElementById("Detail_right_middleCategory3").style.display = 'none';
		document.getElementById("Detail_right_middleCategory4").style.display = 'none';
		document.getElementById("Detail_right_middleCategory5").style.display = 'flex';
	}
		
});



/* ============================== Category Subcat ============================== */

/* =============== IT·프로그래밍 =============== */
document.getElementById("Detail_right_middleCategory_select1").addEventListener('change', function() {
	
	console.log(this.value);
	
	if(this.value === "UX기획") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory1-1").style.display = 'flex';
		document.getElementById("Detail_right_SubcatCategory1-2").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory1-3").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory1-4").style.display = 'none';
	} else if(this.value === "웹") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory1-1").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory1-2").style.display = 'flex';
		document.getElementById("Detail_right_SubcatCategory1-3").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory1-4").style.display = 'none';
	} else if(this.value === "프로그램") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory1-1").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory1-2").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory1-3").style.display = 'flex';
		document.getElementById("Detail_right_SubcatCategory1-4").style.display = 'none';
	} else if(this.value === "커머스") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory1-1").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory1-2").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory1-3").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory1-4").style.display = 'flex';
	}
});

/* =============== 디자인 =============== */
document.getElementById("Detail_right_middleCategory_select2").addEventListener('change', function() {
	
	console.log(this.value);
	
	if(this.value === "로고·브랜딩") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory2-1").style.display = 'flex';
		document.getElementById("Detail_right_SubcatCategory2-2").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory2-3").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory2-4").style.display = 'none';
	} else if(this.value === "인쇄 홍보물") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory2-1").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory2-2").style.display = 'flex';
		document.getElementById("Detail_right_SubcatCategory2-3").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory2-4").style.display = 'none';
	} else if(this.value === "마케팅 디자인") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory2-1").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory2-2").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory2-3").style.display = 'flex';
		document.getElementById("Detail_right_SubcatCategory2-4").style.display = 'none';
	} else if(this.value === "웹·모바일 디자인") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory2-1").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory2-2").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory2-3").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory2-4").style.display = 'flex';
	}
});


/* =============== 영상·사진 =============== */
document.getElementById("Detail_right_middleCategory_select3").addEventListener('change', function() {
	
	console.log(this.value);
	
	if(this.value === "영상") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory3-1").style.display = 'flex';
		document.getElementById("Detail_right_SubcatCategory3-2").style.display = 'none';
	} else if(this.value === "사진") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory3-1").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory3-2").style.display = 'flex';
	} 
});

/* =============== 마케팅 =============== */
document.getElementById("Detail_right_middleCategory_select4").addEventListener('change', function() {
	
	console.log(this.value);
	
	if(this.value === "채널 활성화") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory4-1").style.display = 'flex';
		document.getElementById("Detail_right_SubcatCategory4-2").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory4-3").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory4-4").style.display = 'none';
	} else if(this.value === "바이럴·체험단") {
		ddocument.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory4-1").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory4-2").style.display = 'flex';
		document.getElementById("Detail_right_SubcatCategory4-3").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory4-4").style.display = 'none';
	} else if(this.value === "PR·행사") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory4-1").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory4-2").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory4-3").style.display = 'flex';
		document.getElementById("Detail_right_SubcatCategory4-4").style.display = 'none';
	} else if(this.value === "업종·목적별") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory4-1").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory4-2").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory4-3").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory4-4").style.display = 'flex';
	}
});

/* =============== 교육 =============== */
document.getElementById("Detail_right_middleCategory_select5").addEventListener('change', function() {
	
	console.log(this.value);
	
	if(this.value === "외국어") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory5-1").style.display = 'flex';
		document.getElementById("Detail_right_SubcatCategory5-2").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory5-3").style.display = 'none';
	} else if(this.value === "미술·글쓰기") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory5-1").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory5-2").style.display = 'flex';
		document.getElementById("Detail_right_SubcatCategory5-3").style.display = 'none';
	} else if(this.value === "댄스·뮤직") {
		document.getElementById("Detail_right_SubcatCategory").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory5-1").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory5-2").style.display = 'none';
		document.getElementById("Detail_right_SubcatCategory5-3").style.display = 'flex';
	}
});



document.getElementById("Detail_right_Contents1_Category_Style").addEventListener('change', function() {
    
    document.getElementById("Detail_right_SubcatCategory").style.display = 'flex';
    document.getElementById("Detail_right_SubcatCategory1-1").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory1-2").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory1-3").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory1-4").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory2-1").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory2-2").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory2-3").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory2-4").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory3-1").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory3-2").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory4-1").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory4-2").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory4-3").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory4-4").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory5-1").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory5-2").style.display = 'none';
    document.getElementById("Detail_right_SubcatCategory5-3").style.display = 'none';

    
    if(this.value === "IT·프로그래밍") {
        document.getElementById("Detail_right_middleCategory").style.display = 'none';
        document.getElementById("Detail_right_middleCategory1").style.display = 'flex'
        document.getElementById("Detail_right_middleCategory2").style.display = 'none'
        document.getElementById("Detail_right_middleCategory3").style.display = 'none'
        document.getElementById("Detail_right_middleCategory4").style.display = 'none'
        document.getElementById("Detail_right_middleCategory5").style.display = 'none'
    } else if (this.value === "디자인"){
        document.getElementById("Detail_right_middleCategory").style.display = 'none';
        document.getElementById("Detail_right_middleCategory1").style.display = 'none';
        document.getElementById("Detail_right_middleCategory2").style.display = 'flex';
        document.getElementById("Detail_right_middleCategory3").style.display = 'none';
        document.getElementById("Detail_right_middleCategory4").style.display = 'none';
        document.getElementById("Detail_right_middleCategory5").style.display = 'none';
    } else if (this.value === "영상·사진"){
        document.getElementById("Detail_right_middleCategory").style.display = 'none';
        document.getElementById("Detail_right_middleCategory1").style.display = 'none';
        document.getElementById("Detail_right_middleCategory2").style.display = 'none';
        document.getElementById("Detail_right_middleCategory3").style.display = 'flex';
        document.getElementById("Detail_right_middleCategory4").style.display = 'none';
        document.getElementById("Detail_right_middleCategory5").style.display = 'none';
    } else if (this.value === "마케팅"){
        document.getElementById("Detail_right_middleCategory").style.display = 'none';
        document.getElementById("Detail_right_middleCategory1").style.display = 'none';
        document.getElementById("Detail_right_middleCategory2").style.display = 'none';
        document.getElementById("Detail_right_middleCategory3").style.display = 'none';
        document.getElementById("Detail_right_middleCategory4").style.display = 'flex';
        document.getElementById("Detail_right_middleCategory5").style.display = 'none';
    } else if (this.value === "교육"){
        document.getElementById("Detail_right_middleCategory").style.display = 'none';
        document.getElementById("Detail_right_middleCategory1").style.display = 'none';
        document.getElementById("Detail_right_middleCategory2").style.display = 'none';
        document.getElementById("Detail_right_middleCategory3").style.display = 'none';
        document.getElementById("Detail_right_middleCategory4").style.display = 'none';
        document.getElementById("Detail_right_middleCategory5").style.display = 'flex';
    }
});

