#!/usr/bin/env python3
"""Preview player presentation only; never changes player commands or data."""
from pathlib import Path
import hashlib
import json

EXPECTED = {
    'res/layout/activity_main.xml': '5de71b1a2a27cd0710ecc285d190301c05952e767d1e0e1dafe3f1b21a9ababb',
    'res/layout-w600dp/activity_main.xml': 'ff923fa2c85610655a4139409713434a4e7d933193baa48fcd5c16771ebaeba3',
    'res/drawable/native_player_background.xml': '0dcb1e1d8d94ee6b297250e92cca2ca770ac5555b41b6986746a7ce904bebcf4',
    'res/drawable/native_button_white.xml': '11d9172eac04718f095f936dc1bb0c68cea4041e1410f77ef56eb2b8cd502099',
    'res/drawable/widget_progress_drawable.xml': '6c186a221e3661881e1bde06766f3eab3a518b68a80a75797c3c357d9a3b5e3e',
    'res/drawable/native_cover_placeholder.xml': '7de3b7388690db7fe29181beebcdf2095d71f2e7901f142f1fd0ce4f6d89f554',
}

EXTRAS = {
    'smali/PreviewPlayerChrome$1.smali': '796af03843a855be38897f5c7f3b887ab39c4ec3be9a6edafc695d194ea2300e',
    'smali/PreviewPlayerChrome$2.smali': '4bfba32279835027cf57426d15f6663e06098a1d1088c5c5637e1f496dae818b',
    'smali/PreviewPlayerChrome$PressEffect.smali': 'e31d111f0a51ebaf65c7bcca2dd4bbece9077a30085f0c9017bdf530ebd55f4c',
    'smali/PreviewPlayerChrome$3.smali': '761ef45e82c67c70af1d74d978e155d528a87ef29e1eb34c1ea1e4fe62f746a6',
    'smali/PreviewPlayerChrome$DismissGesture.smali': '134be6e30947bee3194388c2363f006cf9e5fe3dae6254a012fdbad51b75b221',
    'smali/PreviewPlayerChrome.smali': 'a70a9a61788766732dc63833c5f16538852f74cef8a7187a2a28c7ac37ed4d7d',
    'smali/PreviewPlayerMode$1.smali': '2b0047d2ede66423132428772b27eb74ee648b1fe5e12b525781c3e7fddf358d',
    'smali/PreviewPlayerMode$2.smali': 'b98238b4d487a829908df011d523438eeb48d656560794ed30685b918641d87f',
    'smali/PreviewPlayerMode$3.smali': 'f73f71550e68891d12de0aac28307f47638c9b7156a16ef3acd0ed3b7dbbbdc9',
    'smali/PreviewPlayerMode$4.smali': '0f28057c6f65bf1028565952f762dadbab0d0a8c718ff2e44359e6487e9d8312',
    'smali/PreviewPlayerMode$5.smali': '959a113e0df9542f38aed905aa0e7497b3fafef10ea96bdf01158375b9741333',
    'smali/PreviewPlayerMode$6.smali': 'add806e57655d08f230945015e6cc9c57a9d770bc9a33a9d012e662a7f8669ad',
    'smali/PreviewPlayerMode$7$1.smali': '1d7bf526a7135a3a3f1cc2838c09ae527a6975062a4965b7c59a50f8553dd731',
    'smali/PreviewPlayerMode$7.smali': 'ff87048c4d1a3ecbeb18f5f3010482816004b73a1160385c4bf9f9e5284a42b2',
    'smali/PreviewPlayerMode$8.smali': '42531c37ef459f9251d943c24bd274dd9dcad3fc0c5b95fb2c78589a22fc3788',
    'smali/PreviewPlayerMode$9.smali': 'dbcc462e37f32a6869328bcc953a40b8a46b822cd035e1c54549811b31243fbf',
    'smali/PreviewPlayerMode.smali': '238b94ee0bdf081f0017f020ee8abe1c761761aec7359fac28a2a806c58bfaa9',
    'smali/PreviewPlayerTiles$1.smali': '3401aaac8afc8ad0f632f82a17b05320929fe64dd76eb8cbd3d23cd23c7c257d',
    'smali/PreviewPlayerTiles$10.smali': '389e6e07520d5f3c128d9b12583af821a4aea3a8cf3f8d76d3616c645b7071e5',
    'smali/PreviewPlayerTiles$11.smali': '962c471f0c83b5d9e8351759dd90250f616bbcebf9434e6ac66b692bf82f0a1c',
    'smali/PreviewPlayerTiles$12.smali': '686b448eff923757c7d7eefd4d6dfd263c911f1b22f95e8f286f76f5233ee0a6',
    'smali/PreviewPlayerTiles$13.smali': 'bf5bdfb383c20bbdd1c14204a2100c8852db0af1ac4e03997aa4fc5902491c6c',
    'smali/PreviewPlayerTiles$14$1.smali': '94bfd1fa52aece803498a1183c6114fa978fb3acd314b7158506ee7499b8dd0d',
    'smali/PreviewPlayerTiles$14.smali': 'f65e9df2eb2f4a7d499b375a72b06805c8304acacc11971f3cf20f1f58c4ce70',
    'smali/PreviewPlayerTiles$15.smali': '59fdf63e7fd3b3084972c0e53f212a11b034a771bd0054eb200e5975eabffd7f',
    'smali/PreviewPlayerTiles$16.smali': '73b344309d5ad5fbfd2cf700c72102e9d47ab8923a13717e61657d4e633c264d',
    'smali/PreviewPlayerTiles$17.smali': '5a6d6ce688560d3ed9b3d246340738a83c79f776555d9ecafdc5a64ed01f0319',
    'smali/PreviewPlayerTiles$18.smali': '06ade51d547e9c4b55fc92f756fb837b857d7390bf7b6cba621abd32a8a9a40f',
    'smali/PreviewPlayerTiles$19.smali': '0b274fc8b95e9b97a952394cc4893952ec8b233fb9be3f18cf0fd890ef39473c',
    'smali/PreviewPlayerTiles$2.smali': 'b1102cff8f1f2618cd4d44f15de4e5a45f744ee3a36b87b937d4ddd1e51a894b',
    'smali/PreviewPlayerTiles$20.smali': '1627eb1eca0d374589f56f38b87c625fd22d8ea704b9ae1001571cebbc067202',
    'smali/PreviewPlayerTiles$21.smali': 'f511f64a68ceeb920a2196dba9754d7282eba7487dced47ef6e83c304d08ec97',
    'smali/PreviewPlayerTiles$3.smali': '2604388044352531c147ee5df6d7241352677f307d33c16ae9de12b9009765f0',
    'smali/PreviewPlayerTiles$4.smali': '1273dac7c8d73c2ab96468f7b71b036b5fd5e36ed9bb76d14f04779447107ee5',
    'smali/PreviewPlayerTiles$5.smali': 'af241d9bc2aa3fc768a7d7a1b9e87d373691e89e6e629df896bf1921a5b6ba0e',
    'smali/PreviewPlayerTiles$6.smali': 'b062ca671ec7455505e980bcd0c56c4314df349ccf2404b92e323ec7063b599d',
    'smali/PreviewPlayerTiles$7.smali': '384a852b32d931ba0085f47a7d4e8385cbba5419a31a45d38847a0f452a98134',
    'smali/PreviewPlayerTiles$8$1.smali': 'a2826283002b1a2a56fdd9cbe08a4972be06bcf5b636877976e951a51dd6e6e5',
    'smali/PreviewPlayerTiles$8.smali': '41f40c90e8e72d52b458ba44d18f63f889a3202b3b9935c21aae3d1999f80b5d',
    'smali/PreviewPlayerTiles$9.smali': '22f0b173cf36e695852198a3c27a53c4ff5d99625d6a104d0120b87051011b29',
    'smali/PreviewPlayerTiles$15$1.smali': '90328a34f02394813ab75b4edf65ec38b9e97451cd609ed58649ec7ac50711fa',
    'smali/PreviewPlayerTiles$22.smali': '0e6108ca6c35021b29e27f49a127de5d82b431746b557d3139b4d8af949d6a4d',
    'smali/PreviewPlayerTiles.smali': '98deda6706d836b5c82b05b919ef09ff0d0a59574e5bf11247369470ca2fb45e',
    'smali/PreviewPlayerVolume$1.smali': 'c7e81421f5171a2ff6d8cbcc49adf7a3fd7a22e0d653b462b1b485464cf26425',
    'smali/PreviewPlayerVolume$10.smali': 'cd4c4f4d7843a639f2e3295a4cd5b841b5540d456463124cae4f87aea3278ba2',
    'smali/PreviewPlayerVolume$11$1.smali': 'cfb394fc1866083f42220176c962702c5c32d17b890f1ac03e6049f424e66008',
    'smali/PreviewPlayerVolume$11.smali': 'fcb9636959f21852977b29889dbc1b34165c3eea2f1a544f29bc0968fd3d5dc1',
    'smali/PreviewPlayerVolume$12.smali': '55b705ed08b818ef88ff152bc5c3c1427bb1f7ecc09e1a7e415c10d6187623be',
    'smali/PreviewPlayerVolume$13.smali': 'ee4bc32f43f93bf9dfffacd363ab2b66c00fe87b69fdb3f73c9e5b455abb3f71',
    'smali/PreviewPlayerVolume$2.smali': '75dba4a69d8748fb6a6eed66b0c3427a7c4395dc10c29b009f170e5587c9e2d7',
    'smali/PreviewPlayerVolume$3.smali': 'e47748a1d4fd3ec9255b06392348e44eeeb5b134b357aa5cde2bd0de8f0af31a',
    'smali/PreviewPlayerVolume$4.smali': '47dcb4e6b34b241bac5c7266e4d897410fac2c8ac226fac7439090e97b1dc86d',
    'smali/PreviewPlayerVolume$5.smali': 'c30ac86efb76fece48f37d60f010830a1dc6c8517e42f691bd3d36c5a2aa4421',
    'smali/PreviewPlayerVolume$6.smali': '40400f8353d626bf26e2cbf3ffda9f7169583034c64b67c2c3b3fc62246c2b28',
    'smali/PreviewPlayerVolume$7.smali': '0c7f7db1d3407419ca185805896c884c88cb135fdc57651108862953710baa21',
    'smali/PreviewPlayerVolume$8.smali': '6ec713a7757caedac1a8312082b398c405faad4ff365ad71ad44d60a268b49bd',
    'smali/PreviewPlayerVolume$9.smali': '13a7696e8fd191d514c8e687d29e72d819baf6d7cc407b108c7c7edc595d82e1',
    'smali/PreviewPlayerVolume.smali': 'a4f98c7811aa0c3c394c5d9f0dd704205bed6d7bab34a8952c31b3ecd9ce614f',
    'smali/PreviewUiRestyle$1.smali': 'd1713c69f55f62572d7d237af7abfed3aa3ebc08c67a16c5e1899d6741cd883d',
    'smali/PreviewUiRestyle$2.smali': '9bb4b7d718cc66ef94aa23f171790789c78dda5db3d798a406b93612a84725e8',
    'smali/PreviewUiRestyle$3.smali': 'c125de3b79ab91b139d1818174ec08353b6782483b54e4b521bc6906656b2a63',
    'smali/PreviewUiRestyle.smali': '3bd2300ee057c2fe93657ea1e94e917133e9091160f5c11078f9d46fc1bb6296',
    'PreviewPlayerPlayButton.java': '7b080ee533f8e3c2be8d2bba9457d0bf51c32fa44606d4e7fd4604af5189e36a',
    'PreviewPlayerDecoration.java': 'a21b4dffe6c2ba7cbce2d29012e601b88c1a5ac43b56d6cf5b578f0bc104f44d',
    'smali/PreviewPlayerPlayButton.smali': '10fa7289606a9481f8f6af0cac9e36790c1bf1ba73d9218d551ad194e9287e27',
    'smali/PreviewPlayerPlayButton$1.smali': '4fd83f3fd7382c2861383c9b7197d59d28b8dc96808e0cd32f157ccddb4af3a0',
    'smali/PreviewPlayerDecoration.smali': 'd6603b418eaf73a509548f2f74b5a89489d5259dc8b52832f9c720ded5f96f41',
    'PreviewPlayerChrome.java': '4e48244771307cc6525de7f4fad43eeb64fd76e221b3a01c57c3c186eba51682',
    'PreviewPlayerLikeArt.java': '49892fbb54b2c66dd9fe477fc851e55dedb2a4f8a31670e53530e5f03c289979',
    'smali/PreviewPlayerLikeArt.smali': '8caf0d0292ff562b70b85aef9fbe20f306e6bdf7239b337971c063f6fe9888ca',
    'PreviewPlayerMode.java': 'a2a967ed0c5a313f5202b243733ff01d6b5dac35998f23ea9e7ef3528c6a7517',
    'PreviewPlayerTiles.java': '3981f73c5f30ea90b5e6fc85916bdc2c1236b9fbedc367c92d68a5dbef5cd17e',
    'PreviewPlayerVolume.java': '17008c933154cab779dbd6639f00de3127fa94e37653a412c2a9d2be4d38a4ff',
    'control.js': '327fdbe099c28002ff51fe09e81067ea097c36a7ccdb5a9c56e4642da916cd24',
    'control-diagnostic.js': '936d0a75f651ad95b3c5678dae5a6d7280afa5d28a9a8c96ff1a4e928d67f79e',
    'volume-control.js': 'ac4bda4dc78c4bf2248c9af4864fd2246d0fb8dea435a2f929baa684f83d7160',
    'panel-structure.js': '45bcd7ac9dba68aad908a47fd66fd96e2f4feeeabcf1fac3e19399fa150a71f8',
    'panel-read.js': 'e00691f3abe98da90b181e5755cb3674581b14a4f3199bbe23ba1459a2e53368',
    'mode-job.js': '88fc9b321d0c3bb2874f6312a37bdfe41f87dae4136a12214f59a6de2d193f17',
    'queue-job.js': '57b8554edf4222aa2cf959754b43c9ee5f5e6b19e3c8233a0bc565d52610c894',
    'panel-job.js': '35ad49da2e93567cd70b6ca3fbe18fa0af2b18acc8e93ae6fbb34b266276cab1',
}

def one(s, old, new):
    if s.count(old)!=1: raise ValueError('unexpected player layout: '+old[:80])
    return s.replace(old,new,1)

def player_layout(source):
    start=source.index('        <ScrollView\n            android:id="@id/nativePlayerPanel"')
    end=source.index('        </ScrollView>',start)+len('        </ScrollView>')
    panel=source[start:end]
    panel=one(panel,'android:paddingLeft="16.0dip"','android:paddingLeft="24.0dip"')
    panel=one(panel,'android:paddingRight="16.0dip"','android:paddingRight="24.0dip"')
    panel=one(panel,'android:paddingTop="10.0dip"','android:paddingTop="12.0dip"')
    panel=one(panel,'android:paddingBottom="18.0dip"','android:paddingBottom="24.0dip"')
    marker='            <LinearLayout android:orientation="vertical" android:gravity="center" android:layout_width="fill_parent" android:layout_height="wrap_content">\n'
    header='''            <LinearLayout android:orientation="horizontal" android:gravity="center_vertical" android:layout_width="fill_parent" android:layout_height="wrap_content" android:minHeight="48.0dip">
                <ImageButton android:src="@drawable/ic_arrow_down_24dp" android:tint="#ffffffff" android:scaleType="centerInside" android:padding="10.0dip" android:background="@drawable/native_button_dark" android:layout_width="48.0dip" android:layout_height="48.0dip" android:onClick="onNativeBackClick" android:contentDescription="Réduire le lecteur" />
                <TextView android:tag="previewPlayerDragHandle" android:contentDescription="Glisser vers le bas pour réduire le lecteur" android:text="LECTURE EN COURS" android:gravity="center" android:textSize="11.0sp" android:textStyle="bold" android:letterSpacing="0.14" android:textColor="#ffcfc6f2" android:layout_width="0.0dip" android:layout_height="wrap_content" android:layout_weight="1.0" />
                <Space android:tag="previewPlayerHeaderSpacer" android:layout_width="48.0dip" android:layout_height="48.0dip" />
            </LinearLayout>
'''
    panel=one(panel,marker,marker.replace('android:gravity="center"','android:gravity="top"')+'            <com.melodix.music.PreviewPlayerChrome android:tag="previewPlayerChrome" android:layout_width="0.0dip" android:layout_height="0.0dip" />\n'+header)
    old='''            <androidx.cardview.widget.CardView
                android:layout_width="272.0dip"
                android:layout_height="272.0dip"
                android:layout_marginTop="8.0dip"
                android:layout_marginBottom="22.0dip"
                app:cardBackgroundColor="#ff282828"
                app:cardCornerRadius="8.0dip"
                app:cardElevation="18.0dip">'''
    new='''            <androidx.constraintlayout.widget.ConstraintLayout
                android:tag="previewPlayerArtFrame" android:layout_width="fill_parent" android:layout_height="wrap_content"
                android:layout_marginTop="16.0dip" android:layout_marginBottom="20.0dip">
              <androidx.cardview.widget.CardView
                android:tag="previewPlayerArtCard" android:layout_width="0.0dip" android:layout_height="0.0dip"
                app:layout_constraintStart_toStartOf="parent" app:layout_constraintEnd_toEndOf="parent"
                app:layout_constraintTop_toTopOf="parent" app:layout_constraintDimensionRatio="1:1"
                app:layout_constraintWidth_max="318dp"
                app:contentPadding="1.0dip"
                app:cardBackgroundColor="#1fffffff" app:cardCornerRadius="30.0dip" app:cardElevation="26.0dip">'''
    panel=one(panel,old,new)
    panel=one(panel,'            </androidx.cardview.widget.CardView>','              </androidx.cardview.widget.CardView>\n            </androidx.constraintlayout.widget.ConstraintLayout>')
    panel=one(panel,'android:contentDescription="Current track artwork"','android:contentDescription="Pochette du titre"')
    panel=one(panel,'android:src="@drawable/logo_melodix"','android:src="@drawable/native_cover_placeholder"')
    panel=one(panel,'android:textSize="24.0sp"','android:textSize="23.0sp" android:fontFamily="sans-serif" android:textFontWeight="800"')
    panel=one(panel,'android:text="Open Spotify to start listening"','android:text="Lecture arrêtée"')
    panel=one(panel,'android:textSize="15.0sp"','android:textSize="16.0sp"')
    panel=panel.replace('android:textColor="#ffb3b3b3"','android:textColor="#ffc9c0ea"')
    # Align title and artist with the seek bar; retain identity and max lines.
    panel=panel.replace('android:gravity="center"\n                android:maxLines=', 'android:gravity="start"\n                android:maxLines=')
    panel=one(panel,'android:paddingTop="4.0dip"','android:paddingTop="6.0dip"')
    artist_start=panel.index('android:id="@id/nativePlayerLargeArtist"')
    artist_end=panel.index('/>',artist_start)
    artist=panel[artist_start:artist_end].replace('android:maxLines="1"','android:maxLines="2"')
    panel=panel[:artist_start]+artist+panel[artist_end:]
    # The existing player title keeps its ID; the adjacent like is an
    # independently guarded optional command, disabled until observed.
    i=panel.index('            <TextView\n                android:id="@id/nativePlayerLargeTitle"')
    j=panel.index('/>',i)+2
    title=panel[i:j].replace('android:layout_width="fill_parent"','android:layout_width="0.0dip" android:layout_weight="1.0"')
    title='''            <LinearLayout android:orientation="horizontal" android:gravity="center_vertical" android:layout_width="fill_parent" android:layout_height="wrap_content">
'''+title+'''
              <com.melodix.music.PreviewPlayerMode android:tag="like" android:layout_marginLeft="16.0dip" android:background="@drawable/native_button_dark" android:padding="10.0dip" android:layout_width="44.0dip" android:layout_height="44.0dip" android:contentDescription="Like indisponible" />
            </LinearLayout>'''
    panel=panel[:i]+title+panel[j:]
    badge='''            <TextView
                android:text="● Lu via Spotify"
                android:textSize="12.0sp"
                android:textStyle="bold"
                android:textColor="#ffa78bfa"
                android:gravity="center"
                android:paddingTop="6.0dip"
                android:layout_width="fill_parent"
                android:layout_height="wrap_content" />
'''
    panel=one(panel,badge,'')
    panel=one(panel,'android:thumbTint="#ffc0a2ff"','android:thumbTint="#ffffffff"')
    panel=one(panel,'android:maxHeight="6.0dip"','android:maxHeight="5.0dip"')
    seek_start=panel.index('android:id="@id/nativePlayerProgress"'); seek_end=panel.index('/>',seek_start)
    seek=panel[seek_start:seek_end].replace('android:layout_width="fill_parent"','android:layout_width="fill_parent" android:layout_marginLeft="-12.0dip" android:layout_marginRight="-12.0dip"').replace('android:layout_marginTop="16.0dip"','android:layout_marginTop="20.0dip"')
    panel=panel[:seek_start]+seek+panel[seek_end:]
    controls='            <LinearLayout\n                android:orientation="horizontal"\n                android:gravity="center"'
    panel=one(panel,controls,controls+' android:clipChildren="false" android:clipToPadding="false" android:paddingTop="8.0dip" android:paddingBottom="8.0dip"')
    for ident in ('nativePlayerPositionText','nativePlayerDurationText'):
        pos=panel.index('android:id="@id/'+ident+'"');stop=panel.index('/>',pos)
        segment=panel[pos:stop].replace('android:textSize="12.0sp"','android:textSize="12.0sp" android:fontFeatureSettings="tnum"')
        panel=panel[:pos]+segment+panel[stop:]
    marker_remaining='android:tag="nativePlayerRemaining"'
    if marker_remaining in panel:
        pos=panel.index(marker_remaining);stop=panel.index('/>',pos)
        segment=panel[pos:stop].replace('android:textColor="#ffc9c0ea"','android:textColor="#00ffffff"')
        segment=segment.replace('android:paddingBottom="8.0dip"','android:importantForAccessibility="yes" android:focusable="true" android:labelFor="@id/nativePlayerProgress"')
        segment=segment.replace('android:layout_width="fill_parent"','android:layout_width="1.0dip"').replace('android:layout_height="wrap_content"','android:layout_height="1.0dip"')
        panel=panel[:pos]+segment+panel[stop:]
    else:
        controls='            <LinearLayout\n                android:orientation="horizontal"\n                android:gravity="center"'
        remaining='            <TextView android:tag="nativePlayerRemaining" android:text="Temps restant : —" android:textSize="12.0sp" android:textColor="#00ffffff" android:importantForAccessibility="yes" android:focusable="true" android:labelFor="@id/nativePlayerProgress" android:layout_width="1.0dip" android:layout_height="1.0dip" />\n'
        panel=one(panel,controls,remaining+controls)
    for ident in ('nativePlayerShuffleButton','nativePlayerRepeatButton'):
        old='android:id="@id/'+ident+'"'; panel=one(panel,old,old+' android:visibility="gone"')
    for ident,mode,label in (('nativePlayerShuffleButton','shuffle','Aléatoire indisponible'),('nativePlayerRepeatButton','repeat','Répétition indisponible')):
        anchor='                <ImageView android:id="@id/'+ident+'"'
        control='                <com.melodix.music.PreviewPlayerMode android:tag="'+mode+'" android:background="@null" android:padding="10.0dip" android:layout_width="0.0dip" android:layout_weight="1.0" android:layout_height="48.0dip" android:contentDescription="'+label+'" />\n'
        panel=one(panel,anchor,control+anchor)
    for ident in ('nativePlayerPreviousButton','nativePlayerNextButton'):
        i=panel.index('android:id="@id/'+ident+'"'); j=panel.index('/>',i); part=panel[i:j]
        part=part.replace('android:layout_width="54.0dip"','android:layout_width="0.0dip" android:layout_weight="1.0"').replace('android:layout_height="54.0dip"','android:layout_height="56.0dip"').replace('android:layout_marginLeft="12.0dip"','').replace('android:layout_marginRight="12.0dip"','').replace('android:background="@drawable/native_button_dark"','android:background="@null"').replace('Previous track','Titre précédent').replace('Next track','Titre suivant')
        panel=panel[:i]+part+panel[j:]
    panel=one(panel,'<ImageView android:id="@id/nativePlayerLargePlayPauseButton"','<com.melodix.music.PreviewPlayerPlayButton android:id="@id/nativePlayerLargePlayPauseButton"')
    i=panel.index('android:id="@id/nativePlayerLargePlayPauseButton"');j=panel.index('/>',i)
    panel=panel[:i]+panel[i:j].replace('72.0dip','76.0dip').replace('android:padding="24.0dip"','android:padding="25.0dip"').replace('android:background="@drawable/native_button_white"','android:background="@drawable/native_button_white" android:elevation="12.0dip"').replace('android:layout_marginLeft="14.0dip"','').replace('android:layout_marginRight="14.0dip"','')+panel[j:]
    ending='''            </LinearLayout>
            </LinearLayout>
        </ScrollView>'''
    tiles='''            </LinearLayout>
            <Space android:tag="previewPlayerSpacer" android:layout_width="1.0dip" android:layout_height="0.0dip" android:layout_weight="1.0" />
            <com.melodix.music.PreviewPlayerTiles android:tag="previewPlayerTiles" android:layout_width="fill_parent" android:layout_height="wrap_content" android:layout_marginTop="20.0dip" />
            </LinearLayout>
        </ScrollView>'''
    panel=one(panel,ending,tiles)
    return source[:start]+panel+source[end:]

def landscape_layout(source):
    start=source.index('        <ScrollView\n            android:id="@id/nativePlayerPanel"')
    end=source.index('        </ScrollView>',start)+len('        </ScrollView>')
    panel=source[start:end]
    art='''            <androidx.constraintlayout.widget.ConstraintLayout
                android:tag="previewPlayerArtFrame" android:layout_width="fill_parent" android:layout_height="wrap_content"
                android:layout_marginTop="16.0dip" android:layout_marginBottom="20.0dip">'''
    landscape='''            <LinearLayout android:orientation="horizontal" android:gravity="top" android:layout_width="fill_parent" android:layout_height="wrap_content">
            <androidx.constraintlayout.widget.ConstraintLayout
                android:tag="previewPlayerArtFrame" android:layout_width="0.0dip" android:layout_weight="0.44" android:layout_height="wrap_content"
                android:layout_marginTop="12.0dip" android:layout_marginBottom="12.0dip" android:layout_marginRight="18.0dip">'''
    panel=one(panel,art,landscape)
    panel=one(panel,'            </androidx.constraintlayout.widget.ConstraintLayout>', '''            </androidx.constraintlayout.widget.ConstraintLayout>
            <LinearLayout android:orientation="vertical" android:layout_width="0.0dip" android:layout_weight="0.56" android:layout_height="wrap_content" android:layout_marginTop="12.0dip">''')
    ending='''            <Space android:tag="previewPlayerSpacer" android:layout_width="1.0dip" android:layout_height="0.0dip" android:layout_weight="1.0" />
            <com.melodix.music.PreviewPlayerTiles android:tag="previewPlayerTiles" android:layout_width="fill_parent" android:layout_height="wrap_content" android:layout_marginTop="20.0dip" />
            </LinearLayout>
        </ScrollView>'''
    panel=one(panel,ending,'''            <Space android:tag="previewPlayerSpacer" android:layout_width="1.0dip" android:layout_height="0.0dip" android:layout_weight="1.0" />
            <com.melodix.music.PreviewPlayerTiles android:tag="previewPlayerTiles" android:layout_width="fill_parent" android:layout_height="wrap_content" android:layout_marginTop="20.0dip" />
            </LinearLayout>
            </LinearLayout>
            </LinearLayout>
        </ScrollView>''')
    return source[:start]+panel+source[end:]

def apply(root):
    root=Path(root); data={}
    here=Path(__file__).resolve().parent/'preview-extras'
    for name,digest in EXTRAS.items():
        if hashlib.sha256((here/name).read_bytes()).hexdigest()!=digest: raise ValueError('unexpected optional control '+name)
    js=(here/'control.js').read_text(encoding='utf8')
    if json.dumps(js,ensure_ascii=True) not in (here/'PreviewPlayerMode.java').read_text(encoding='utf8'):
        raise ValueError('control script/source mismatch')
    if json.dumps((here/'control-diagnostic.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerMode.java').read_text(encoding='utf8'):
        raise ValueError('diagnostic script/source mismatch')
    if json.dumps((here/'volume-control.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerVolume.java').read_text(encoding='utf8'):
        raise ValueError('volume script/source mismatch')
    if json.dumps((here/'panel-structure.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerTiles.java').read_text(encoding='utf8'):
        raise ValueError('panel probe/source mismatch')
    if json.dumps((here/'panel-read.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerTiles.java').read_text(encoding='utf8'):
        raise ValueError('panel read/source mismatch')
    if json.dumps((here/'mode-job.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerMode.java').read_text(encoding='utf8'):
        raise ValueError('mode job/source mismatch')
    if json.dumps((here/'queue-job.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerTiles.java').read_text(encoding='utf8'):
        raise ValueError('queue job/source mismatch')
    if json.dumps((here/'panel-job.js').read_text(encoding='utf8'),ensure_ascii=True) not in (here/'PreviewPlayerTiles.java').read_text(encoding='utf8'):
        raise ValueError('panel job/source mismatch')
    for name,digest in EXPECTED.items():
        raw=(root/name).read_bytes()
        if hashlib.sha256(raw).hexdigest()!=digest: raise ValueError('unexpected visual input '+name)
        data[name]=raw.decode('utf8')
    activity='smali/com/melodix/music/MainActivity.smali'
    original=(root/activity).read_text(encoding='utf8')
    entry='.method public final onNativeBackClick(Landroid/view/View;)V\n    .locals 6\n'
    hook=entry+'''    # Only the full-player view may defer Back for its close animation.
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerChrome;->interceptBack(Landroid/app/Activity;)Z
    move-result v0
    if-eqz v0, :preview_close_continue
    return-void
    :preview_close_continue
'''
    original=one(original,entry,hook)
    capture='''    :save_player_return_state
    invoke-direct {p0}, Lcom/melodix/music/MainActivity;->lot1PushBack()V'''
    capture_hook='''    :save_player_return_state
    # Capture only the native shell before it is replaced by the player.
    invoke-static {p0}, Lcom/melodix/music/PreviewPlayerChrome;->captureBeforeExpand(Landroid/app/Activity;)V
    invoke-direct {p0}, Lcom/melodix/music/MainActivity;->lot1PushBack()V'''
    data[activity]=one(original,capture,capture_hook)
    for name in list(EXPECTED)[:2]: data[name]=player_layout(data[name])
    for target,base in (('res/layout-land/activity_main.xml','res/layout/activity_main.xml'),
                        ('res/layout-w600dp-land/activity_main.xml','res/layout-w600dp/activity_main.xml')):
        if (root/target).exists(): raise ValueError('unexpected landscape layout '+target)
        data[target]=landscape_layout(data[base])
    data['res/drawable/native_player_background.xml']='''<?xml version="1.0" encoding="utf-8"?>
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
  <item><shape><gradient android:angle="270" android:startColor="#ff2b1456" android:centerColor="#ff170b33" android:endColor="#ff0a0614" /></shape></item>
  <item android:gravity="top|left" android:width="260dp" android:height="260dp"><shape><gradient android:type="radial" android:gradientRadius="130dp" android:startColor="#737b3fe4" android:endColor="#007b3fe4" /></shape></item>
  <item android:gravity="bottom|right" android:bottom="150dp" android:width="240dp" android:height="240dp"><shape><gradient android:type="radial" android:gradientRadius="120dp" android:startColor="#59e0489e" android:endColor="#00e0489e" /></shape></item>
</layer-list>
'''
    data['res/drawable/native_button_white.xml']=data['res/drawable/native_button_white.xml'].replace('#7C3AED','#7B3FE4').replace('#DB2777','#E0489E').replace('android:angle="0"','android:angle="135"')
    progress=data['res/drawable/widget_progress_drawable.xml']
    progress=one(progress,'<gradient android:angle="0" android:startColor="#ff302b3b" android:endColor="#ff433b50" />','<gradient android:angle="0" android:startColor="#2effffff" android:endColor="#2effffff" />')
    progress=one(progress,'<gradient android:angle="0" android:startColor="#ff956fe9" android:centerColor="#ffc0a2ff" android:endColor="#ffe8d9ff" />','<gradient android:angle="0" android:startColor="#ff7b3fe4" android:endColor="#ffe0489e" />')
    data['res/drawable/widget_progress_drawable.xml']=progress
    # Shared decorative fallback only; the existing loader remains unchanged.
    data['res/drawable/native_cover_placeholder.xml']='''<?xml version="1.0" encoding="utf-8"?>
<layer-list xmlns:android="http://schemas.android.com/apk/res/android">
  <item><shape><size android:width="96dp" android:height="96dp"/><gradient android:angle="135" android:startColor="#ff7b3fe4" android:centerColor="#ff2b1456" android:endColor="#ffe0489e"/></shape></item>
  <item android:gravity="center" android:width="48dp" android:height="48dp"><vector android:width="48dp" android:height="48dp" android:viewportWidth="24" android:viewportHeight="24"><path android:fillColor="#ffffffff" android:pathData="M2,11h1v2H2z M5,8h1v8H5z M8,5h1v14H8z M11,3h1v18h-1z M14,6h1v12h-1z M17,4h1v16h-1z M20,8h1v8h-1z M23,11h1v2h-1z"/></vector></item>
</layer-list>
'''
    for name,text in data.items():
        path=root/name;path.parent.mkdir(parents=True,exist_ok=True);path.write_text(text,encoding='utf8')
    for name in EXTRAS:
        if name.startswith('smali/'):
            dest=root/'smali/com/melodix/music'/Path(name).name
            if dest.exists(): raise ValueError('optional controller already exists')
            dest.write_bytes((here/name).read_bytes())
