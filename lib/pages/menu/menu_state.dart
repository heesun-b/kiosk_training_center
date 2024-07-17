import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:kiosk_training_center/dto/author.dart';
import 'package:kiosk_training_center/dto/cart.dart';
import 'package:kiosk_training_center/dto/work.dart';
import 'dart:ui' as ui;


class MenuState {
  int currentPage = 0;
  int peopleCount = 0;

  PageController pageController = PageController();
  ScrollController scrollController1 = ScrollController();
  ScrollController scrollController2 = ScrollController();
  ScrollController scrollController3 = ScrollController();

  List<String> menu = ['프로젝트소개', '도움말', '전보경', '최지목', '한솔'];

  List<Cart> cartList =[];

  List<Author> author = [
    Author(
        name: '전보경',
        infoPath: 'assets/textfiles/author_jbk.txt',
        works: [
          Work(
              krName: 'Zeros: 오류의 동작',
              enName: 'Zeros: Operation Errors',
              caption: '2020, 2채널 비디오의 단채널 버전, 컬러, 사운드, 13분 20초',
              imagePath: 'assets/images/works/zeros_operation_errors.jpg',
              videoPath: 'file:///C:/Users/loves/OneDrive/Desktop/artwork/jun/error.mp4',
              infoPath: 'assets/textfiles/work_zeros_operation_errors.txt')]
    ),
    Author(
        name: '최지목',
        infoPath: 'assets/textfiles/author_cjm.txt',
        works: [
          Work(
              krName: '아버지와의 대화',
              enName: 'A Dialogue between Father and Son',
              caption: '2021, 퍼포먼스 비디오, 단채널, 컬러, 사운드, 26분 45초',
              imagePath: 'assets/images/works/a_dialogue_between_father_and_son.png',
              videoPath: 'file:///C:/Users/loves/OneDrive/Desktop/artwork/choi/father.mp4',
              infoPath:'assets/textfiles/work_a_dialogue_between_father_and_son.txt'),
          Work(
              krName: '흰석기 시대',
              enName: 'White Stone Age',
              caption: '2021, 인터뷰 비디오, 단채널, 컬러, 사운드, 10분 30초',
              imagePath: 'assets/images/works/white_stone_age.png',
              videoPath: 'file:///C:/Users/loves/OneDrive/Desktop/artwork/choi/white.mp4',
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
              videoPath: 'file:///C:/Users/loves/OneDrive/Desktop/artwork/han/inherited_home.mp4',
              infoPath: 'assets/textfiles/work_inherited_home.txt' ),
          Work(
              krName: '기묘한 집',
              enName: 'Strange House',
              caption: '2023, 단채널 비디오, 컬러, 사운드, 15분 33초',
              imagePath: 'assets/images/works/strange_house.png',
              videoPath: 'file:///C:/Users/loves/OneDrive/Desktop/artwork/han/strange house_pre sound remaster.mp4',
              infoPath: 'assets/textfiles/work_strange_house.txt'),
          Work(
              krName: '나들이',
              enName: 'Picnic',
              caption: '2023, 다채널 비디오, 컬러, 사운드, 14분 48초',
              imagePath: 'assets/images/works/picnic_1.png',
              videoPath: 'file:///C:/Users/loves/OneDrive/Desktop/artwork/han/picnic_1.mp4',
              infoPath: 'assets/textfiles/work_picnic_1.txt'),
          Work(
              krName: '나들이',
              enName: 'Picnic',
              caption: '2023, 단채널 비디오, 컬러, 사운드, 2분 24초',
              imagePath: 'assets/images/works/picnic_window_single.png',
              videoPath: 'file:///C:/Users/loves/OneDrive/Desktop/artwork/han/picnic_window_single.mp4',
              infoPath: 'assets/textfiles/work_picnic_1_single.txt'),
          Work(
              krName: '나들이2',
              enName: 'Picnic2',
              caption: '2023, 단채널 비디오, 컬러, 사운드, 11분 53초',
              imagePath: 'assets/images/works/picnic_2.png',
              videoPath: 'file:///C:/Users/loves/OneDrive/Desktop/artwork/han/PICNIC2.mp4',
              infoPath: 'assets/textfiles/work_picnic_2.txt'),
        ])
  ];


  /// 장바구니 결제용
  int currentPaymentStep = 0;
  bool clickedFirstStep = false;
  ui.Image? signImage;
}