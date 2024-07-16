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
              videoPath: 'https://firebasestorage.googleapis.com/v0/b/grow-maps-platform.appspot.com/o/temp%2F42-english_32%E1%84%83%E1%85%A29%E1%84%87%E1%85%B5%E1%84%8B%E1%85%B2%E1%86%AF2.mp4?alt=media&token=bed6d050-da8c-4877-a980-d3f05b79f864',
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
              videoPath: 'https://firebasestorage.googleapis.com/v0/b/grow-maps-platform.appspot.com/o/temp%2F%E1%84%8B%E1%85%A1%E1%84%87%E1%85%A5%E1%84%8C%E1%85%B5%E1%84%8B%E1%85%AA%E1%84%8B%E1%85%B4%20%E1%84%83%E1%85%A2%E1%84%92%E1%85%AA%20%E1%84%92%E1%85%A1%E1%86%AB%E1%84%80%E1%85%B3%E1%86%AF%E1%84%8C%E1%85%A1%E1%84%86%E1%85%A1%E1%86%A8.MP4?alt=media&token=42d08934-dfde-49c1-a457-d9a428a32140',
              infoPath:'assets/textfiles/work_a_dialogue_between_father_and_son.txt'),
          Work(
              krName: '흰석기 시대',
              enName: 'White Stone Age',
              caption: '2021, 인터뷰 비디오, 단채널, 컬러, 사운드, 10분 30초',
              imagePath: 'assets/images/works/white_stone_age.png',
              videoPath: 'https://firebasestorage.googleapis.com/v0/b/grow-maps-platform.appspot.com/o/temp%2F%E1%84%92%E1%85%B4%E1%86%AB%E1%84%89%E1%85%A5%E1%86%A8%E1%84%80%E1%85%B5%E1%84%89%E1%85%B5%E1%84%83%E1%85%A2.MP4?alt=media&token=caf84310-9b4c-4e54-8ce8-36bfb9c7f9ba',
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
              videoPath: 'https://firebasestorage.googleapis.com/v0/b/grow-maps-platform.appspot.com/o/temp%2Finherited%20home.mp4?alt=media&token=2846b455-38a3-442e-bb30-55105c9a22e9',
              infoPath: 'assets/textfiles/work_inherited_home.txt' ),
          Work(
              krName: '기묘한 집',
              enName: 'Strange House',
              caption: '2023, 단채널 비디오, 컬러, 사운드, 15분 33초',
              imagePath: 'assets/images/works/strange_house.png',
              videoPath: 'https://firebasestorage.googleapis.com/v0/b/grow-maps-platform.appspot.com/o/temp%2Fstrange%20house_pre%20sound%20remaster.mp4?alt=media&token=148f933c-d7d2-4df3-aa2f-aa5b88117a41',
              infoPath: 'assets/textfiles/work_strange_house.txt'),
          Work(
              krName: '나들이',
              enName: 'Picnic',
              caption: '2023, 다채널 비디오, 컬러, 사운드, 14분 48초',
              imagePath: 'assets/images/works/picnic_1.png',
              videoPath: 'https://firebasestorage.googleapis.com/v0/b/grow-maps-platform.appspot.com/o/temp%2Fpicnic_1.mp4?alt=media&token=3b3686fb-897b-4b3e-a652-6e593929f4b7',
              infoPath: 'assets/textfiles/work_picnic_1.txt'),
          Work(
              krName: '나들이',
              enName: 'Picnic',
              caption: '2023, 단채널 비디오, 컬러, 사운드, 2분 24초',
              imagePath: 'assets/images/works/picnic_window_single.png',
              videoPath: 'https://firebasestorage.googleapis.com/v0/b/grow-maps-platform.appspot.com/o/temp%2Fpicnic_window_single.mp4?alt=media&token=f09c6c93-baed-49e0-9c4e-6ff9577c2280',
              infoPath: 'assets/textfiles/work_picnic_1_single.txt'),
          Work(
              krName: '나들이2',
              enName: 'Picnic2',
              caption: '2023, 단채널 비디오, 컬러, 사운드, 11분 53초',
              imagePath: 'assets/images/works/picnic_2.png',
              videoPath: 'https://firebasestorage.googleapis.com/v0/b/grow-maps-platform.appspot.com/o/temp%2FPICNIC2.mp4?alt=media&token=fc09f91d-e65b-4cf5-a687-8b3ff69da54d',
              infoPath: 'assets/textfiles/work_picnic_2.txt'),
        ])
  ];


  /// 장바구니 결제용
  int currentPaymentStep = 0;
  bool clickedFirstStep = false;
  ui.Image? signImage;
}