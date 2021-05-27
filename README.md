# school-life
학교 커뮤니티 웹사이트 만들기 프로젝트
# 1. 프로젝트 개요
## 1.1 프로젝트 목표
현재 나와있는 학교 커뮤니티 사이트는 가입절차가 까다롭지 않아 타학교 학생들도 쉽게 가입할 수 있고, 또 학생이 아닌 사람들도 가입할 수 있어 중고사기, 허위사실유포 등 많은 문제가 발생한다. 그래서 이번 프로젝트를 통해 각 학교마다 사용할 수 있는 커뮤니티 웹사이트를 만들어 보안성을 조금 더 높이는것을 목표로 한다. 현재 학교 커뮤니티 사이트와 관련된 오픈소스가 다양하게 올라와 있지는 않으므로 다양한 사람들이 참고하고 이용할 수 있도록 오픈소스로 학교 커뮤니티 사이트를 제작하려 한다. 본 프로젝트의 목적은 웹사이트의 지속적인 발전과 확대이므로 소스코드를 오픈하여 다양한 피드백을 얻고자 한다.
## 1.2 프로젝트 범위
본 프로젝트의 결과물은 커뮤니티 웹사이트 개발시에 공통적으로 필요한 기능들을 재사용 관점에서 구조화 하는 pc용 프레임워크이다. 공유용으로 이용될 것이며 이를 이용해 커뮤니티 웹사이트를 만드는 사용자들은 공유된 결과물을 통해 기본적인 기능과 UI를 이용할 수 있을 것으로 예상된다. 
또한 본 프로젝트의 결과물은 호서대학교를 기준으로 제작하여 외부 개발자들과 함께 공유하고 발전시켜 다양한 학교들에도 적용할 수 있도록 할 예정이다.

# 2. 프로젝트 일정
## Gantt Chart
![image](https://user-images.githubusercontent.com/84116509/119257865-30d2a600-bc02-11eb-9e93-d62cd8ed1cb3.png)

# 3. 전체 설명
## 3.2 주요기능
로그인 기능: 사용자에게 로그인 정보 값을 입력받아 올바르지 않을 시에는 오류메시지를 출력하고 올바를 시에는 웹 페이지로 연결된다.<br>
시간표 기능: 과목 이름과 과목 시간의 값을 입력받으면 db를 통해 값을 저장한 뒤 시간표 화면에 출력한다.<br>
학점계산기 기능: 과목 이름과 학점을 입력하면 db를 통해 값을 저장한 뒤 평균 값을 계산해서 학점계산기 화면에 출력한다.<br>
게시판 기능: 게시판 글 작성을 통해 제목 및 내용을 입력받으면 db를 통해 게시판에 작성자, 제목, 내용 등을 화면에 출력한다.<br>

