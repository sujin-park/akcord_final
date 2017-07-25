회원 검색

select id, major_name from users u, major m
where u.major_id = m.major_id and type = 1

회원 초대

insert into grouproom_list (group_id, user_id, is_accept)
values (?,?,0)

승인

승인 취소

승인 리스트

일정과 관련된 글 보기
select my.subject, my.content, my.update_date
from grouproom_hw gh, myroom_next my
where gh.myroom_next_id = my.myroom_next_id
and schedule_id = ?
