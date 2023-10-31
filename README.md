# school-life
학교 커뮤니티 웹사이트 만들기 프로젝트

# 데모영상
<a href="https://youtu.be/ER-rZm9xmt4?si=occ7by0W3xPtYi2I">
  <img src="https://github.com/holosolozo/school-life/assets/84116509/0ac8c7ed-fe43-45dc-8448-ee46c077e614">
</a>

# 1. 프로젝트 개요
## 1.1 프로젝트 목표
현재 나와있는 학교 커뮤니티 사이트는 가입절차가 까다롭지 않아 타학교 학생들도 쉽게 가입할 수 있고, 또 학생이 아닌 사람들도 가입할 수 있어 중고사기, 허위사실유포 등 많은 문제가 발생한다. <br>그래서 이번 프로젝트를 통해 각 학교마다 사용할 수 있는 커뮤니티 웹사이트를 만들어 보안성을 조금 더 높이는것을 목표로 한다. <br>현재 학교 커뮤니티 사이트와 관련된 오픈소스가 다양하게 올라와 있지는 않으므로 다양한 사람들이 참고하고 이용할 수 있도록 오픈소스로 학교 커뮤니티 사이트를 제작하려 한다. <br>본 프로젝트의 목적은 웹사이트의 지속적인 발전과 확대이므로 소스코드를 오픈하여 다양한 피드백을 얻고자 한다.
## 1.2 프로젝트 범위
본 프로젝트의 결과물은 커뮤니티 웹사이트 개발시에 공통적으로 필요한 기능들을 재사용 관점에서 구조화 하는 pc용 프레임워크이다. <br>공유용으로 이용될 것이며 이를 이용해 커뮤니티 웹사이트를 만드는 사용자들은 공유된 결과물을 통해 기본적인 기능과 UI를 이용할 수 있을 것으로 예상된다. <br>
또한 본 프로젝트의 결과물은 호서대학교를 기준으로 제작하여 외부 개발자들과 함께 공유하고 발전시켜 다양한 학교들에도 적용할 수 있도록 할 예정이다. <br>

# 2. 프로젝트 일정
## Gantt Chart
![image](https://user-images.githubusercontent.com/84116509/119257865-30d2a600-bc02-11eb-9e93-d62cd8ed1cb3.png)
# 3. 전체 설명

## 3.1 시스템 구성
![image](https://user-images.githubusercontent.com/84116509/120065076-741d9080-c0aa-11eb-916d-035580e9b357.png)
## 3.2 동작 방식
### Sequence Diagram
![image](https://user-images.githubusercontent.com/84116509/120067223-628db600-c0b5-11eb-998c-a1a7c65f2dae.png)
<br><br>
![image](https://user-images.githubusercontent.com/84116509/120833562-e4da1680-c59c-11eb-9f79-6fd7cc22a979.png)
<br><br>
![image](https://user-images.githubusercontent.com/84116509/121890298-244ef280-cd55-11eb-9114-01064d554998.png)
<br><br>
![image](https://user-images.githubusercontent.com/84116509/121890735-a5a68500-cd55-11eb-960e-cb46317e0308.png)
<br><br>
![image](https://user-images.githubusercontent.com/84116509/121892256-7a249a00-cd57-11eb-9789-a2db36a51bed.png)

## 3.3 주요기능
![image](https://user-images.githubusercontent.com/74487628/120094097-578c6180-c159-11eb-9245-867c462c2f21.png)
**로그인**<br>
∙ 회원가입을 통해 등록한 ID/PW를 통해 로그인 할 수 있는 기능<br>
∙ ID/PW는 DB에 저장<br>
**시간표**<br>
∙ 자신의 수강하는 수업을 추가하여 시간표를 등록하여 사용할 수 있는 기능<br>
∙ 저장된 시간표는  DB에 저장<br>
**성적관리**<br>
∙ 자신의 성적을 기입하여 학점을 계산할 수 있는 학점 계산기 기능<br>
∙ 계산된 학점을 기입하여 평균학점을 확인할 수 있는 성적 기입란<br>
∙ 기입된 학점들은 DB에 저장<br>
**게시판**<br>
∙ 학생들과의 커뮤니케이션을 위해 글쓰기가 가능<br>
∙ 게시글들은 DB에 저장<br>
**메모장**<br>
∙ 자신에게 필요한 내용들은 저장할 수 있는 메모장 기능<br>
∙ 저장된 내용들은 DB에 저장<br>
## 3.4 사용자 프로파일
- 본 프로그램의 주요 사용자는 20대 대학생 사용자들이다. 
![image](https://user-images.githubusercontent.com/84116509/122416730-f02d3900-cfc3-11eb-9525-c64fc4ef0d2b.png) <br>
![image](https://user-images.githubusercontent.com/84116509/122420528-b873c080-cfc6-11eb-9980-4265f33d5a12.png)

## 3.5 설계와 구현상 제약 조건
∙ 반드시 사용해야 할 기술 : node.js <br>
∙ 설계 도구: powerpoint <br>
∙ 개발 도구: JDK, Eclipse, Github, JRE, JDBC <br>
∙ 개발 언어: Java <br>
∙ 데이터베이스: Oracle SQL Developer <br>
∙ 준수해야할 개발 규칙: 프로그래밍 가이드, 오류코드 가이드
<br>
## 3.6 가정과 종속 관계
**가정**<br>
∙ 웹브라우저를 통해 서비스한다.<br>
∙ 회원정보 및 게시글은 DB를 통해 저장을 한다.<br>
<br>
**종속**<br>
∙ 모바일은 지원하지 않는다. 단, 모바일 브라우저에서 pc버전으로 변경한다면 특정 해상도 이상은 볼 수 있다.<br>
∙ 회원이 아니거나 회원정보와 다른 경우 이용에 제한이 생긴다.<br>
<br>

## 4. 제품기능
### 4.1 대분류
웹 사이트 기능<br>
> 4.1.1 중분류 1 : 로그인 기능<br>
>
> 아이디와 비밀번호 값을 입력받아 올바르지 않으면 오류메세지를 출력하고 올바를 시에는 웹사이트로 연결됩니다.<br>
> > 4.1.1.1 소분류 1 : 회원가입<br>
> > 회원가입 시 사용자 이름, 아이디, 패스워드, 이메일 주소의 정보값을 입력받고, 입력된 정보값은 데이터베이스에 저장이 된다. 가입을 하면 즉시 회원으로 등록되고 바로 웹사이트 이용이 가능하다.<br> 
> > 
> 4.1.2 중분류 2 : 시간표 기능<br>
> 사용자가 과목 이름, 과목 시간을 시간표에 나타낼 수 있는 기능이다.<br> 
> > 4.1.2.1 소분류 1 : 과목 입력<br>
> > 사용자가 과목 이름을 입력하는 DB에 저장한 뒤 입력 받은 과목 이름을 출력한다.<br>
> > 
> > 4.1.2.2 소분류 2 : 시간표 등록<br>
> > 사용자가 과목 시간을 입력받아 DB에 저장한 뒤 입력 받은 과목 시간을 출력한다.<br>
> > 
> 4.1.3 중분류 3 : 게시판 기능<br>
> 사용자가 게시판 작성, 검색, 수정을 할 수 있는 기능이다.<br>
> > 4.1.3.1 소분류 1 : 게시판 작성<br>
> > 사용자가 게시판 제목, 게시판 내용을 입력하면 DB에 저장한 뒤 입력 받은 값을 게시판에 출력한다.<br>
> > > 4.1.3.1.1 세분류 1 : 게시판 등록<br>
> > > 사용자가 입력한 제목 및 내용을 게시판 등록 버튼으로 누를 시에 게시판에 출력하는 기능이다.<br>
> > > 
> > 4.1.3.2 소분류 2 : 게시판 검색<br>
> >  사용자가 검색하고 싶은 제목 및 내용을 검색 버튼으로 누를 시에검색한 값에 맞는 게시판을 화면에 출력한다.<br>
> >  
> > 4.1.3.3 소분류 3 : 게시판 수정<br>
> >  사용자가 수정하고 싶은 제목 및 내용을 수정한 뒤 수정 버튼을 누를 시에 수정한 내용으로 DB에 저장한 뒤 게시판에 출력한다. <br>
> >  
> 4.1.4 중분류 4 : 메모장 기능<br>
>  사용자가 메모장 추가, 등록, 삭제를 할 수 있는 기능이다.<br>
> 
> > 4.1.4.1 소분류 1 : 메모장 추가<br>
> >  사용자가 메모장 내용, 제목을 입력하면 DB에 저장한 뒤 입력 받은 값을 메모장에 출력한다.<br>
> >
> > > 4.1.4.1.1 세분류 1 : 메모장 등록<br>
> > > 사용자가 입력한 제목 및 내용을 메모장 등록 버튼으로 누를 시에 메모장에 출력하는 기능이다.<br>
> > > 
> > 4.1.4.2 소분류 2 : 메모장 삭제<br>
> >  사용자가 삭제하고 싶은 제목 및 내용을 삭제 버튼으로 누를 시에 DB에서 데이터를 삭제한 뒤 나머지 내용을 메모장에 출력한다.<br>
> >  
> 4.1.5 중분류 5 : 학점계산기 기능<br>
> 사용자가 학점 입력, 학점 계산, 재입력 할 수 있는 기능이다.<br>
>
> > 4.1.5.1 소분류 1 : 학점 입력<br>
> > 사용자가 학점을 입력한 뒤 학점 입력 버튼을 누를 시에 DB에 데이터를 저장한 뒤 학점을 출력한다. <br>
> >
> > 4.1.5.2 소분류 2 : 학점 계산<br>
> > 사용자가 출력된 학점을 학점 계산 버튼을 누를 시에 학점을 계산한 값을 DB에 저장한 뒤 평균 학점을 화면에 출력한다. <br>
> >
> > 4.1.5.3 소분류 3 : 재입력<br>
> > 사용자가 출력된 평균 학점이나 입력한 학점이 잘못 되거나 되돌리고 싶을 때 재입력 버튼을 누를 시에 이전 화면인 학점계산기 페이지로 넘어간다.<br>


