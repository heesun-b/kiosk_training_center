import 'package:flutter/material.dart';
import 'package:kiosk_training_center/dto/author.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/dto/work.dart';

class MenuState {
  int currentPage = 0;
  int peopleCount = 0;

  PageController pageController = PageController();
  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();
  ScrollController scrollController3 = ScrollController();

  List<String> menu = ['프로젝트소개', '도움말', '전보경', '최지목', '한솔'];

  List<Cart> cartList =[];
  List<Cart> selectList =[];

  List<Author> author = [
    Author(
        name: '전보경',
        infoPath: 'assets/textfiles/author_jbk.txt',
        works: [
          Work(
              krName: 'Zeros: 오류의 동작',
              enName: 'Zeros: Operation Errors',
              caption: '2020, 2채널 비디오의 단채널 버전, 컬러, 사운드, 13분 20초',
              imagePath: 'assets/images/works/zeros_operation_errors.png',
              videoPath: 'assets/videos/zeros_operation_errors.MP4',
              infoPath: 'assets/textfiles/work_zeros_operation_errors.txt')]
    ),
    Author(
        name: '최지목',
        infoPath: 'assets/textfiles/author_cjm.txt',
        works: [
          Work(
              krName: '아버지와의 대화',
              enName: 'A Dialogue between Father and Son',
              caption: '2021, 퍼포먼스 비디오, 단채널, 컬러, 사운드, 20분 07초',
              imagePath: 'assets/images/works/a_dialogue_between_father_and_son.png',
              videoPath: 'assets/videos/a_dialogue_between_father_and_son.MP4',
              infoPath:'assets/textfiles/work_a_dialogue_between_father_and_son.txt'),
          Work(
              krName: '흰석기 시대',
              enName: 'White Stone Age',
              caption: '2021, 인터뷰 비디오, 단채널, 컬러, 사운드, 26분 45초',
              imagePath: 'assets/images/works/white_stone_age.png',
              videoPath: 'assets/videos/white_stone_age.MP4',
              infoPath:'assets/textfiles/work_white_stone_age.txt' )
        ]),
    Author(
        name: '한솔',
        infoPath: 'assets/textfiles/author_hs.txt',
        works: [
          Work(
              krName: '계승된 집',
              enName: 'Inherited home',
              caption: '2023, 단채널 비디오, 컬러, 사운드, 20분 7초',
              imagePath: 'assets/images/works/inherited_home.png',
              videoPath: 'assets/videos/inherited_home.MP4',
              infoPath: 'assets/textfiles/work_inherited_home.txt' ),
          Work(
              krName: '기묘한 집',
              enName: 'Strange House',
              caption: '2023, 단채널 비디오, 컬러, 사운드, 15분 33초',
              imagePath: 'assets/images/works/strange_house.png',
              videoPath: 'assets/videos/strange_house.MP4',
              infoPath: null),
          Work(
              krName: '나들이',
              enName: 'Picnic',
              caption: '2023, 단채널 비디오, 컬러, 사운드, 2분 24초',
              imagePath: 'assets/images/works/picnic_window_single.png',
              videoPath: 'assets/videos/picnic_window_single.MP4',
              infoPath: null),
          Work(
              krName: '나들이',
              enName: 'Picnic',
              caption: '2023, 다채널 비디오, 컬러, 사운드, 14분 48초',
              imagePath: 'assets/images/works/picnic_1.png',
              videoPath: 'assets/videos/picnic_1.MP4',
              infoPath: null),
          Work(
              krName: '나들이2',
              enName: 'Picnic2',
              caption: '2023, 단채널 비디오, 컬러, 사운드, 11분 53초',
              imagePath: 'assets/images/works/picnic_2.png',
              videoPath: 'assets/videos/picnic_2.MP4',
              infoPath: null),
        ])
  ];

}