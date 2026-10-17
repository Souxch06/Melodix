.class public final Ler0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lzp0;
.implements Lwi;
.implements Ljw0;
.implements Lkw0;


# instance fields
.field public final synthetic j:I

.field public k:Ljava/lang/Object;

.field public l:Ljava/lang/Object;

.field public m:Ljava/lang/Object;

.field public n:Ljava/lang/Object;


# direct methods
.method public constructor <init>(I)V
    .locals 4

    iput p1, p0, Ler0;->j:I

    sparse-switch p1, :sswitch_data_0

    .line 1017
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1018
    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Ler0;->l:Ljava/lang/Object;

    .line 1019
    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Ler0;->m:Ljava/lang/Object;

    .line 1020
    new-instance p1, Ljava/util/ArrayDeque;

    invoke-direct {p1}, Ljava/util/ArrayDeque;-><init>()V

    iput-object p1, p0, Ler0;->n:Ljava/lang/Object;

    return-void

    .line 1021
    :sswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lxn0;

    const/16 v0, 0x15

    invoke-direct {p1, v0}, Lxn0;-><init>(I)V

    iput-object p1, p0, Ler0;->k:Ljava/lang/Object;

    new-instance v1, Ler0;

    const/4 v2, 0x0

    .line 1022
    invoke-direct {v1, v2, p1}, Ler0;-><init>(Ler0;Lxn0;)V

    iput-object v1, p0, Ler0;->m:Ljava/lang/Object;

    .line 1023
    invoke-virtual {v1}, Ler0;->y()Ler0;

    move-result-object p1

    iput-object p1, p0, Ler0;->l:Ljava/lang/Object;

    new-instance p1, Lny0;

    .line 1024
    invoke-direct {p1, v0}, Lny0;-><init>(I)V

    iput-object p1, p0, Ler0;->n:Ljava/lang/Object;

    new-instance p0, Lkd2;

    .line 1025
    invoke-direct {p0, p1}, Lkd2;-><init>(Lny0;)V

    const-string v0, "require"

    invoke-virtual {v1, v0, p0}, Ler0;->A(Ljava/lang/String;Lst1;)V

    sget-object p0, Lxw1;->b:Lxw1;

    .line 1026
    iget-object p1, p1, Lny0;->k:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    const-string v0, "internal.platform"

    invoke-virtual {p1, v0, p0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 1027
    new-instance p0, Lrr1;

    const-wide/16 v2, 0x0

    .line 1028
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    move-result-object p1

    invoke-direct {p0, p1}, Lrr1;-><init>(Ljava/lang/Double;)V

    const-string p1, "runtime.counter"

    invoke-virtual {v1, p1, p0}, Ler0;->A(Ljava/lang/String;Lst1;)V

    return-void

    .line 1029
    :sswitch_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1030
    new-instance p1, Ljava/util/LinkedHashMap;

    invoke-direct {p1}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object p1, p0, Ler0;->n:Ljava/lang/Object;

    .line 1031
    const-string p1, "GET"

    iput-object p1, p0, Ler0;->l:Ljava/lang/Object;

    .line 1032
    new-instance p1, Lrb0;

    invoke-direct {p1}, Lrb0;-><init>()V

    iput-object p1, p0, Ler0;->m:Ljava/lang/Object;

    return-void

    .line 1033
    :sswitch_2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1034
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ler0;->k:Ljava/lang/Object;

    .line 1035
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Ler0;->l:Ljava/lang/Object;

    .line 1036
    new-instance p1, Ljava/util/HashMap;

    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    iput-object p1, p0, Ler0;->m:Ljava/lang/Object;

    return-void

    :sswitch_data_0
    .sparse-switch
        0x8 -> :sswitch_2
        0xa -> :sswitch_1
        0x11 -> :sswitch_0
    .end sparse-switch
.end method

.method public synthetic constructor <init>(IZ)V
    .locals 0

    .line 1037
    iput p1, p0, Ler0;->j:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/view/ActionMode$Callback;)V
    .locals 1

    const/16 v0, 0xd

    iput v0, p0, Ler0;->j:I

    .line 1068
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1069
    iput-object p1, p0, Ler0;->k:Ljava/lang/Object;

    .line 1070
    iput-object p2, p0, Ler0;->l:Ljava/lang/Object;

    .line 1071
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Ler0;->m:Ljava/lang/Object;

    .line 1072
    new-instance p1, Lu71;

    invoke-direct {p1}, Lu71;-><init>()V

    iput-object p1, p0, Ler0;->n:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Typeface;Lao0;)V
    .locals 7

    const/16 v0, 0x9

    iput v0, p0, Ler0;->j:I

    .line 1038
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1039
    iput-object p1, p0, Ler0;->n:Ljava/lang/Object;

    .line 1040
    iput-object p2, p0, Ler0;->k:Ljava/lang/Object;

    .line 1041
    new-instance p1, Lbo0;

    const/16 v0, 0x400

    invoke-direct {p1, v0}, Lbo0;-><init>(I)V

    iput-object p1, p0, Ler0;->m:Ljava/lang/Object;

    const/4 p1, 0x6

    .line 1042
    invoke-virtual {p2, p1}, Lib1;->a(I)I

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1043
    iget v2, p2, Lib1;->a:I

    add-int/2addr v0, v2

    .line 1044
    iget-object v2, p2, Lib1;->d:Ljava/lang/Object;

    check-cast v2, Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v0}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v2

    add-int/2addr v2, v0

    .line 1045
    iget-object v0, p2, Lib1;->d:Ljava/lang/Object;

    check-cast v0, Ljava/nio/ByteBuffer;

    invoke-virtual {v0, v2}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v0

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    mul-int/lit8 v0, v0, 0x2

    .line 1046
    new-array v0, v0, [C

    iput-object v0, p0, Ler0;->l:Ljava/lang/Object;

    .line 1047
    invoke-virtual {p2, p1}, Lib1;->a(I)I

    move-result p1

    if-eqz p1, :cond_1

    .line 1048
    iget v0, p2, Lib1;->a:I

    add-int/2addr p1, v0

    .line 1049
    iget-object v0, p2, Lib1;->d:Ljava/lang/Object;

    check-cast v0, Ljava/nio/ByteBuffer;

    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v0

    add-int/2addr v0, p1

    .line 1050
    iget-object p1, p2, Lib1;->d:Ljava/lang/Object;

    check-cast p1, Ljava/nio/ByteBuffer;

    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result p1

    goto :goto_1

    :cond_1
    move p1, v1

    :goto_1
    move p2, v1

    :goto_2
    if-ge p2, p1, :cond_7

    .line 1051
    new-instance v0, Lme1;

    invoke-direct {v0, p0, p2}, Lme1;-><init>(Ler0;I)V

    .line 1052
    invoke-virtual {v0}, Lme1;->b()Lzn0;

    move-result-object v2

    const/4 v3, 0x4

    .line 1053
    invoke-virtual {v2, v3}, Lib1;->a(I)I

    move-result v3

    if-eqz v3, :cond_2

    iget-object v4, v2, Lib1;->d:Ljava/lang/Object;

    check-cast v4, Ljava/nio/ByteBuffer;

    iget v2, v2, Lib1;->a:I

    add-int/2addr v3, v2

    invoke-virtual {v4, v3}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v2

    goto :goto_3

    :cond_2
    move v2, v1

    .line 1054
    :goto_3
    iget-object v3, p0, Ler0;->l:Ljava/lang/Object;

    check-cast v3, [C

    mul-int/lit8 v4, p2, 0x2

    invoke-static {v2, v3, v4}, Ljava/lang/Character;->toChars(I[CI)I

    .line 1055
    invoke-virtual {v0}, Lme1;->b()Lzn0;

    move-result-object v2

    const/16 v3, 0x10

    .line 1056
    invoke-virtual {v2, v3}, Lib1;->a(I)I

    move-result v4

    if-eqz v4, :cond_3

    .line 1057
    iget v5, v2, Lib1;->a:I

    add-int/2addr v4, v5

    .line 1058
    iget-object v5, v2, Lib1;->d:Ljava/lang/Object;

    check-cast v5, Ljava/nio/ByteBuffer;

    invoke-virtual {v5, v4}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v5

    add-int/2addr v5, v4

    .line 1059
    iget-object v2, v2, Lib1;->d:Ljava/lang/Object;

    check-cast v2, Ljava/nio/ByteBuffer;

    invoke-virtual {v2, v5}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v2

    goto :goto_4

    :cond_3
    move v2, v1

    :goto_4
    const/4 v4, 0x1

    if-lez v2, :cond_4

    move v2, v4

    goto :goto_5

    :cond_4
    move v2, v1

    :goto_5
    if-eqz v2, :cond_6

    .line 1060
    iget-object v2, p0, Ler0;->m:Ljava/lang/Object;

    check-cast v2, Lbo0;

    .line 1061
    invoke-virtual {v0}, Lme1;->b()Lzn0;

    move-result-object v5

    .line 1062
    invoke-virtual {v5, v3}, Lib1;->a(I)I

    move-result v3

    if-eqz v3, :cond_5

    .line 1063
    iget v6, v5, Lib1;->a:I

    add-int/2addr v3, v6

    .line 1064
    iget-object v6, v5, Lib1;->d:Ljava/lang/Object;

    check-cast v6, Ljava/nio/ByteBuffer;

    invoke-virtual {v6, v3}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v6

    add-int/2addr v6, v3

    .line 1065
    iget-object v3, v5, Lib1;->d:Ljava/lang/Object;

    check-cast v3, Ljava/nio/ByteBuffer;

    invoke-virtual {v3, v6}, Ljava/nio/ByteBuffer;->getInt(I)I

    move-result v3

    goto :goto_6

    :cond_5
    move v3, v1

    :goto_6
    sub-int/2addr v3, v4

    .line 1066
    invoke-virtual {v2, v0, v1, v3}, Lbo0;->a(Lme1;II)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_2

    .line 1067
    :cond_6
    const-string p0, "invalid metadata codepoint length"

    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    const/4 p0, 0x0

    throw p0

    :cond_7
    return-void
.end method

.method public constructor <init>(Ler0;Lxn0;)V
    .locals 1

    const/16 v0, 0x12

    iput v0, p0, Ler0;->j:I

    .line 1004
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ler0;->m:Ljava/lang/Object;

    new-instance v0, Ljava/util/HashMap;

    .line 1005
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Ler0;->n:Ljava/lang/Object;

    iput-object p1, p0, Ler0;->k:Ljava/lang/Object;

    iput-object p2, p0, Ler0;->l:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lgq0;)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    iput v2, v0, Ler0;->j:I

    .line 7
    .line 8
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 9
    .line 10
    .line 11
    new-instance v3, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance v3, Landroid/os/Bundle;

    .line 17
    .line 18
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v3, v0, Ler0;->n:Ljava/lang/Object;

    .line 22
    .line 23
    iput-object v1, v0, Ler0;->m:Ljava/lang/Object;

    .line 24
    .line 25
    iget-object v3, v1, Lgq0;->a:Landroid/content/Context;

    .line 26
    .line 27
    iget-object v4, v1, Lgq0;->r:Ljava/util/ArrayList;

    .line 28
    .line 29
    iget-object v5, v1, Lgq0;->c:Ljava/util/ArrayList;

    .line 30
    .line 31
    iget-object v6, v1, Lgq0;->d:Ljava/util/ArrayList;

    .line 32
    .line 33
    iput-object v3, v0, Ler0;->k:Ljava/lang/Object;

    .line 34
    .line 35
    sget v7, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 36
    .line 37
    const/16 v8, 0x1a

    .line 38
    .line 39
    if-lt v7, v8, :cond_0

    .line 40
    .line 41
    iget-object v7, v1, Lgq0;->o:Ljava/lang/String;

    .line 42
    .line 43
    invoke-static {v3, v7}, Lar0;->a(Landroid/content/Context;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    iput-object v7, v0, Ler0;->l:Ljava/lang/Object;

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    new-instance v7, Landroid/app/Notification$Builder;

    .line 51
    .line 52
    invoke-direct {v7, v3}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    .line 53
    .line 54
    .line 55
    iput-object v7, v0, Ler0;->l:Ljava/lang/Object;

    .line 56
    .line 57
    :goto_0
    iget-object v9, v1, Lgq0;->q:Landroid/app/Notification;

    .line 58
    .line 59
    iget-wide v10, v9, Landroid/app/Notification;->when:J

    .line 60
    .line 61
    invoke-virtual {v7, v10, v11}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    .line 62
    .line 63
    .line 64
    move-result-object v10

    .line 65
    iget v11, v9, Landroid/app/Notification;->icon:I

    .line 66
    .line 67
    iget v12, v9, Landroid/app/Notification;->iconLevel:I

    .line 68
    .line 69
    invoke-virtual {v10, v11, v12}, Landroid/app/Notification$Builder;->setSmallIcon(II)Landroid/app/Notification$Builder;

    .line 70
    .line 71
    .line 72
    move-result-object v10

    .line 73
    iget-object v11, v9, Landroid/app/Notification;->contentView:Landroid/widget/RemoteViews;

    .line 74
    .line 75
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setContent(Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    .line 76
    .line 77
    .line 78
    move-result-object v10

    .line 79
    iget-object v11, v9, Landroid/app/Notification;->tickerText:Ljava/lang/CharSequence;

    .line 80
    .line 81
    const/4 v12, 0x0

    .line 82
    invoke-virtual {v10, v11, v12}, Landroid/app/Notification$Builder;->setTicker(Ljava/lang/CharSequence;Landroid/widget/RemoteViews;)Landroid/app/Notification$Builder;

    .line 83
    .line 84
    .line 85
    move-result-object v10

    .line 86
    iget-object v11, v9, Landroid/app/Notification;->vibrate:[J

    .line 87
    .line 88
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    .line 89
    .line 90
    .line 91
    move-result-object v10

    .line 92
    iget v11, v9, Landroid/app/Notification;->ledARGB:I

    .line 93
    .line 94
    iget v13, v9, Landroid/app/Notification;->ledOnMS:I

    .line 95
    .line 96
    iget v14, v9, Landroid/app/Notification;->ledOffMS:I

    .line 97
    .line 98
    invoke-virtual {v10, v11, v13, v14}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    .line 99
    .line 100
    .line 101
    move-result-object v10

    .line 102
    iget v11, v9, Landroid/app/Notification;->flags:I

    .line 103
    .line 104
    const/4 v13, 0x2

    .line 105
    and-int/2addr v11, v13

    .line 106
    const/4 v14, 0x1

    .line 107
    if-eqz v11, :cond_1

    .line 108
    .line 109
    move v11, v14

    .line 110
    goto :goto_1

    .line 111
    :cond_1
    move v11, v2

    .line 112
    :goto_1
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    .line 113
    .line 114
    .line 115
    move-result-object v10

    .line 116
    iget v11, v9, Landroid/app/Notification;->flags:I

    .line 117
    .line 118
    and-int/lit8 v11, v11, 0x8

    .line 119
    .line 120
    if-eqz v11, :cond_2

    .line 121
    .line 122
    move v11, v14

    .line 123
    goto :goto_2

    .line 124
    :cond_2
    move v11, v2

    .line 125
    :goto_2
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    .line 126
    .line 127
    .line 128
    move-result-object v10

    .line 129
    iget v11, v9, Landroid/app/Notification;->flags:I

    .line 130
    .line 131
    and-int/lit8 v11, v11, 0x10

    .line 132
    .line 133
    if-eqz v11, :cond_3

    .line 134
    .line 135
    move v11, v14

    .line 136
    goto :goto_3

    .line 137
    :cond_3
    move v11, v2

    .line 138
    :goto_3
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setAutoCancel(Z)Landroid/app/Notification$Builder;

    .line 139
    .line 140
    .line 141
    move-result-object v10

    .line 142
    iget v11, v9, Landroid/app/Notification;->defaults:I

    .line 143
    .line 144
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    .line 145
    .line 146
    .line 147
    move-result-object v10

    .line 148
    iget-object v11, v1, Lgq0;->e:Ljava/lang/CharSequence;

    .line 149
    .line 150
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 151
    .line 152
    .line 153
    move-result-object v10

    .line 154
    iget-object v11, v1, Lgq0;->f:Ljava/lang/CharSequence;

    .line 155
    .line 156
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 157
    .line 158
    .line 159
    move-result-object v10

    .line 160
    invoke-virtual {v10, v12}, Landroid/app/Notification$Builder;->setContentInfo(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 161
    .line 162
    .line 163
    move-result-object v10

    .line 164
    iget-object v11, v1, Lgq0;->g:Landroid/app/PendingIntent;

    .line 165
    .line 166
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 167
    .line 168
    .line 169
    move-result-object v10

    .line 170
    iget-object v11, v9, Landroid/app/Notification;->deleteIntent:Landroid/app/PendingIntent;

    .line 171
    .line 172
    invoke-virtual {v10, v11}, Landroid/app/Notification$Builder;->setDeleteIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    .line 173
    .line 174
    .line 175
    move-result-object v10

    .line 176
    iget v11, v9, Landroid/app/Notification;->flags:I

    .line 177
    .line 178
    and-int/lit16 v11, v11, 0x80

    .line 179
    .line 180
    if-eqz v11, :cond_4

    .line 181
    .line 182
    move v11, v14

    .line 183
    goto :goto_4

    .line 184
    :cond_4
    move v11, v2

    .line 185
    :goto_4
    invoke-virtual {v10, v12, v11}, Landroid/app/Notification$Builder;->setFullScreenIntent(Landroid/app/PendingIntent;Z)Landroid/app/Notification$Builder;

    .line 186
    .line 187
    .line 188
    move-result-object v10

    .line 189
    invoke-virtual {v10, v2}, Landroid/app/Notification$Builder;->setNumber(I)Landroid/app/Notification$Builder;

    .line 190
    .line 191
    .line 192
    move-result-object v10

    .line 193
    invoke-virtual {v10, v2, v2, v2}, Landroid/app/Notification$Builder;->setProgress(IIZ)Landroid/app/Notification$Builder;

    .line 194
    .line 195
    .line 196
    iget-object v10, v1, Lgq0;->h:Landroidx/core/graphics/drawable/IconCompat;

    .line 197
    .line 198
    if-nez v10, :cond_5

    .line 199
    .line 200
    move-object v3, v12

    .line 201
    goto :goto_5

    .line 202
    :cond_5
    invoke-static {v10, v3}, Lld0;->g(Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 203
    .line 204
    .line 205
    move-result-object v3

    .line 206
    :goto_5
    invoke-static {v7, v3}, Lyq0;->b(Landroid/app/Notification$Builder;Landroid/graphics/drawable/Icon;)Landroid/app/Notification$Builder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v7, v12}, Landroid/app/Notification$Builder;->setSubText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    invoke-virtual {v3, v2}, Landroid/app/Notification$Builder;->setUsesChronometer(Z)Landroid/app/Notification$Builder;

    .line 214
    .line 215
    .line 216
    move-result-object v3

    .line 217
    iget v7, v1, Lgq0;->i:I

    .line 218
    .line 219
    invoke-virtual {v3, v7}, Landroid/app/Notification$Builder;->setPriority(I)Landroid/app/Notification$Builder;

    .line 220
    .line 221
    .line 222
    iget-object v3, v1, Lgq0;->k:Lvq0;

    .line 223
    .line 224
    instance-of v7, v3, Llq0;

    .line 225
    .line 226
    if-eqz v7, :cond_f

    .line 227
    .line 228
    move-object v15, v3

    .line 229
    check-cast v15, Llq0;

    .line 230
    .line 231
    iget-object v3, v15, Llq0;->d:Landroid/app/PendingIntent;

    .line 232
    .line 233
    iget-object v7, v15, Llq0;->h:Ljava/lang/Integer;

    .line 234
    .line 235
    const v16, 0x7f0800bc

    .line 236
    .line 237
    .line 238
    if-nez v3, :cond_6

    .line 239
    .line 240
    const v19, 0x7f06002b

    .line 241
    .line 242
    .line 243
    iget-object v3, v15, Llq0;->e:Landroid/app/PendingIntent;

    .line 244
    .line 245
    const v17, 0x7f11002d

    .line 246
    .line 247
    .line 248
    move-object/from16 v20, v3

    .line 249
    .line 250
    move-object/from16 v18, v7

    .line 251
    .line 252
    invoke-virtual/range {v15 .. v20}, Llq0;->c(IILjava/lang/Integer;ILandroid/app/PendingIntent;)Lbq0;

    .line 253
    .line 254
    .line 255
    move-result-object v3

    .line 256
    goto :goto_6

    .line 257
    :cond_6
    move-object/from16 v18, v7

    .line 258
    .line 259
    const v17, 0x7f11002c

    .line 260
    .line 261
    .line 262
    const v19, 0x7f06002b

    .line 263
    .line 264
    .line 265
    move-object/from16 v20, v3

    .line 266
    .line 267
    invoke-virtual/range {v15 .. v20}, Llq0;->c(IILjava/lang/Integer;ILandroid/app/PendingIntent;)Lbq0;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    :goto_6
    iget-object v7, v15, Llq0;->c:Landroid/app/PendingIntent;

    .line 272
    .line 273
    if-nez v7, :cond_7

    .line 274
    .line 275
    move-object v7, v12

    .line 276
    goto :goto_b

    .line 277
    :cond_7
    iget-boolean v10, v15, Llq0;->f:Z

    .line 278
    .line 279
    if-eqz v10, :cond_8

    .line 280
    .line 281
    const v11, 0x7f0800ba

    .line 282
    .line 283
    .line 284
    :goto_7
    move/from16 v16, v11

    .line 285
    .line 286
    goto :goto_8

    .line 287
    :cond_8
    const v11, 0x7f0800b8

    .line 288
    .line 289
    .line 290
    goto :goto_7

    .line 291
    :goto_8
    if-eqz v10, :cond_9

    .line 292
    .line 293
    const v10, 0x7f11002b

    .line 294
    .line 295
    .line 296
    :goto_9
    move/from16 v17, v10

    .line 297
    .line 298
    goto :goto_a

    .line 299
    :cond_9
    const v10, 0x7f11002a

    .line 300
    .line 301
    .line 302
    goto :goto_9

    .line 303
    :goto_a
    iget-object v10, v15, Llq0;->g:Ljava/lang/Integer;

    .line 304
    .line 305
    const v19, 0x7f06002a

    .line 306
    .line 307
    .line 308
    move-object/from16 v20, v7

    .line 309
    .line 310
    move-object/from16 v18, v10

    .line 311
    .line 312
    invoke-virtual/range {v15 .. v20}, Llq0;->c(IILjava/lang/Integer;ILandroid/app/PendingIntent;)Lbq0;

    .line 313
    .line 314
    .line 315
    move-result-object v7

    .line 316
    :goto_b
    new-instance v10, Ljava/util/ArrayList;

    .line 317
    .line 318
    const/4 v11, 0x3

    .line 319
    invoke-direct {v10, v11}, Ljava/util/ArrayList;-><init>(I)V

    .line 320
    .line 321
    .line 322
    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 323
    .line 324
    .line 325
    iget-object v3, v15, Lvq0;->mBuilder:Lgq0;

    .line 326
    .line 327
    iget-object v3, v3, Lgq0;->b:Ljava/util/ArrayList;

    .line 328
    .line 329
    if-eqz v3, :cond_d

    .line 330
    .line 331
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 332
    .line 333
    .line 334
    move-result v11

    .line 335
    move v15, v2

    .line 336
    :goto_c
    if-ge v15, v11, :cond_d

    .line 337
    .line 338
    invoke-virtual {v3, v15}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    move-result-object v16

    .line 342
    add-int/lit8 v15, v15, 0x1

    .line 343
    .line 344
    move-object/from16 v8, v16

    .line 345
    .line 346
    check-cast v8, Lbq0;

    .line 347
    .line 348
    invoke-virtual {v8}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 349
    .line 350
    .line 351
    iget-object v2, v8, Lbq0;->a:Landroid/os/Bundle;

    .line 352
    .line 353
    const-string v12, "key_action_priority"

    .line 354
    .line 355
    invoke-virtual {v2, v12}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;)Z

    .line 356
    .line 357
    .line 358
    move-result v2

    .line 359
    if-eqz v2, :cond_a

    .line 360
    .line 361
    goto :goto_d

    .line 362
    :cond_a
    if-le v13, v14, :cond_b

    .line 363
    .line 364
    invoke-virtual {v10, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 365
    .line 366
    .line 367
    add-int/lit8 v13, v13, -0x1

    .line 368
    .line 369
    :cond_b
    :goto_d
    if-eqz v7, :cond_c

    .line 370
    .line 371
    if-ne v13, v14, :cond_c

    .line 372
    .line 373
    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    add-int/lit8 v13, v13, -0x1

    .line 377
    .line 378
    :cond_c
    const/4 v2, 0x0

    .line 379
    const/16 v8, 0x1a

    .line 380
    .line 381
    const/4 v12, 0x0

    .line 382
    goto :goto_c

    .line 383
    :cond_d
    if-eqz v7, :cond_e

    .line 384
    .line 385
    if-lt v13, v14, :cond_e

    .line 386
    .line 387
    invoke-virtual {v10, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 388
    .line 389
    .line 390
    :cond_e
    invoke-virtual {v10}, Ljava/util/ArrayList;->size()I

    .line 391
    .line 392
    .line 393
    move-result v2

    .line 394
    const/4 v3, 0x0

    .line 395
    :goto_e
    if-ge v3, v2, :cond_10

    .line 396
    .line 397
    invoke-virtual {v10, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 398
    .line 399
    .line 400
    move-result-object v7

    .line 401
    add-int/lit8 v3, v3, 0x1

    .line 402
    .line 403
    check-cast v7, Lbq0;

    .line 404
    .line 405
    invoke-virtual {v0, v7}, Ler0;->a(Lbq0;)V

    .line 406
    .line 407
    .line 408
    goto :goto_e

    .line 409
    :cond_f
    iget-object v2, v1, Lgq0;->b:Ljava/util/ArrayList;

    .line 410
    .line 411
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 412
    .line 413
    .line 414
    move-result v3

    .line 415
    const/4 v7, 0x0

    .line 416
    :goto_f
    if-ge v7, v3, :cond_10

    .line 417
    .line 418
    invoke-virtual {v2, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 419
    .line 420
    .line 421
    move-result-object v8

    .line 422
    add-int/lit8 v7, v7, 0x1

    .line 423
    .line 424
    check-cast v8, Lbq0;

    .line 425
    .line 426
    invoke-virtual {v0, v8}, Ler0;->a(Lbq0;)V

    .line 427
    .line 428
    .line 429
    goto :goto_f

    .line 430
    :cond_10
    iget-object v2, v1, Lgq0;->m:Landroid/os/Bundle;

    .line 431
    .line 432
    if-eqz v2, :cond_11

    .line 433
    .line 434
    iget-object v3, v0, Ler0;->n:Ljava/lang/Object;

    .line 435
    .line 436
    check-cast v3, Landroid/os/Bundle;

    .line 437
    .line 438
    invoke-virtual {v3, v2}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    .line 439
    .line 440
    .line 441
    :cond_11
    iget-object v2, v0, Ler0;->l:Ljava/lang/Object;

    .line 442
    .line 443
    check-cast v2, Landroid/app/Notification$Builder;

    .line 444
    .line 445
    iget-boolean v3, v1, Lgq0;->j:Z

    .line 446
    .line 447
    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setShowWhen(Z)Landroid/app/Notification$Builder;

    .line 448
    .line 449
    .line 450
    iget-object v2, v0, Ler0;->l:Ljava/lang/Object;

    .line 451
    .line 452
    check-cast v2, Landroid/app/Notification$Builder;

    .line 453
    .line 454
    iget-boolean v3, v1, Lgq0;->l:Z

    .line 455
    .line 456
    invoke-static {v2, v3}, Lwq0;->i(Landroid/app/Notification$Builder;Z)Landroid/app/Notification$Builder;

    .line 457
    .line 458
    .line 459
    iget-object v2, v0, Ler0;->l:Ljava/lang/Object;

    .line 460
    .line 461
    check-cast v2, Landroid/app/Notification$Builder;

    .line 462
    .line 463
    const/4 v3, 0x0

    .line 464
    invoke-static {v2, v3}, Lwq0;->g(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 465
    .line 466
    .line 467
    iget-object v2, v0, Ler0;->l:Ljava/lang/Object;

    .line 468
    .line 469
    check-cast v2, Landroid/app/Notification$Builder;

    .line 470
    .line 471
    invoke-static {v2, v3}, Lwq0;->j(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 472
    .line 473
    .line 474
    iget-object v2, v0, Ler0;->l:Ljava/lang/Object;

    .line 475
    .line 476
    check-cast v2, Landroid/app/Notification$Builder;

    .line 477
    .line 478
    const/4 v7, 0x0

    .line 479
    invoke-static {v2, v7}, Lwq0;->h(Landroid/app/Notification$Builder;Z)Landroid/app/Notification$Builder;

    .line 480
    .line 481
    .line 482
    iget-object v2, v0, Ler0;->l:Ljava/lang/Object;

    .line 483
    .line 484
    check-cast v2, Landroid/app/Notification$Builder;

    .line 485
    .line 486
    invoke-static {v2, v3}, Lxq0;->b(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 487
    .line 488
    .line 489
    iget-object v2, v0, Ler0;->l:Ljava/lang/Object;

    .line 490
    .line 491
    check-cast v2, Landroid/app/Notification$Builder;

    .line 492
    .line 493
    invoke-static {v2, v7}, Lxq0;->c(Landroid/app/Notification$Builder;I)Landroid/app/Notification$Builder;

    .line 494
    .line 495
    .line 496
    iget-object v2, v0, Ler0;->l:Ljava/lang/Object;

    .line 497
    .line 498
    check-cast v2, Landroid/app/Notification$Builder;

    .line 499
    .line 500
    iget v7, v1, Lgq0;->n:I

    .line 501
    .line 502
    invoke-static {v2, v7}, Lxq0;->f(Landroid/app/Notification$Builder;I)Landroid/app/Notification$Builder;

    .line 503
    .line 504
    .line 505
    iget-object v2, v0, Ler0;->l:Ljava/lang/Object;

    .line 506
    .line 507
    check-cast v2, Landroid/app/Notification$Builder;

    .line 508
    .line 509
    invoke-static {v2, v3}, Lxq0;->d(Landroid/app/Notification$Builder;Landroid/app/Notification;)Landroid/app/Notification$Builder;

    .line 510
    .line 511
    .line 512
    iget-object v2, v0, Ler0;->l:Ljava/lang/Object;

    .line 513
    .line 514
    check-cast v2, Landroid/app/Notification$Builder;

    .line 515
    .line 516
    iget-object v3, v9, Landroid/app/Notification;->sound:Landroid/net/Uri;

    .line 517
    .line 518
    iget-object v7, v9, Landroid/app/Notification;->audioAttributes:Landroid/media/AudioAttributes;

    .line 519
    .line 520
    invoke-static {v2, v3, v7}, Lxq0;->e(Landroid/app/Notification$Builder;Landroid/net/Uri;Ljava/lang/Object;)Landroid/app/Notification$Builder;

    .line 521
    .line 522
    .line 523
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 524
    .line 525
    const-string v3, ""

    .line 526
    .line 527
    const/16 v7, 0x1c

    .line 528
    .line 529
    if-ge v2, v7, :cond_18

    .line 530
    .line 531
    if-nez v5, :cond_12

    .line 532
    .line 533
    const/4 v2, 0x0

    .line 534
    goto :goto_12

    .line 535
    :cond_12
    new-instance v2, Ljava/util/ArrayList;

    .line 536
    .line 537
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 538
    .line 539
    .line 540
    move-result v8

    .line 541
    invoke-direct {v2, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 542
    .line 543
    .line 544
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 545
    .line 546
    .line 547
    move-result v8

    .line 548
    const/4 v9, 0x0

    .line 549
    :goto_10
    if-ge v9, v8, :cond_15

    .line 550
    .line 551
    invoke-virtual {v5, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 552
    .line 553
    .line 554
    move-result-object v10

    .line 555
    add-int/lit8 v9, v9, 0x1

    .line 556
    .line 557
    check-cast v10, Let0;

    .line 558
    .line 559
    iget-object v11, v10, Let0;->a:Ljava/lang/CharSequence;

    .line 560
    .line 561
    iget-object v10, v10, Let0;->c:Ljava/lang/String;

    .line 562
    .line 563
    if-eqz v10, :cond_13

    .line 564
    .line 565
    goto :goto_11

    .line 566
    :cond_13
    if-eqz v11, :cond_14

    .line 567
    .line 568
    new-instance v10, Ljava/lang/StringBuilder;

    .line 569
    .line 570
    const-string v12, "name:"

    .line 571
    .line 572
    invoke-direct {v10, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 573
    .line 574
    .line 575
    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 576
    .line 577
    .line 578
    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 579
    .line 580
    .line 581
    move-result-object v10

    .line 582
    goto :goto_11

    .line 583
    :cond_14
    move-object v10, v3

    .line 584
    :goto_11
    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 585
    .line 586
    .line 587
    goto :goto_10

    .line 588
    :cond_15
    :goto_12
    if-nez v2, :cond_16

    .line 589
    .line 590
    goto :goto_13

    .line 591
    :cond_16
    if-nez v4, :cond_17

    .line 592
    .line 593
    move-object v4, v2

    .line 594
    goto :goto_13

    .line 595
    :cond_17
    new-instance v8, Lha;

    .line 596
    .line 597
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 598
    .line 599
    .line 600
    move-result v9

    .line 601
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 602
    .line 603
    .line 604
    move-result v10

    .line 605
    add-int/2addr v10, v9

    .line 606
    invoke-direct {v8, v10}, Lha;-><init>(I)V

    .line 607
    .line 608
    .line 609
    invoke-virtual {v8, v2}, Lha;->addAll(Ljava/util/Collection;)Z

    .line 610
    .line 611
    .line 612
    invoke-virtual {v8, v4}, Lha;->addAll(Ljava/util/Collection;)Z

    .line 613
    .line 614
    .line 615
    new-instance v4, Ljava/util/ArrayList;

    .line 616
    .line 617
    invoke-direct {v4, v8}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 618
    .line 619
    .line 620
    :cond_18
    :goto_13
    if-eqz v4, :cond_19

    .line 621
    .line 622
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 623
    .line 624
    .line 625
    move-result v2

    .line 626
    if-nez v2, :cond_19

    .line 627
    .line 628
    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    .line 629
    .line 630
    .line 631
    move-result v2

    .line 632
    const/4 v8, 0x0

    .line 633
    :goto_14
    if-ge v8, v2, :cond_19

    .line 634
    .line 635
    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 636
    .line 637
    .line 638
    move-result-object v9

    .line 639
    add-int/lit8 v8, v8, 0x1

    .line 640
    .line 641
    check-cast v9, Ljava/lang/String;

    .line 642
    .line 643
    iget-object v10, v0, Ler0;->l:Ljava/lang/Object;

    .line 644
    .line 645
    check-cast v10, Landroid/app/Notification$Builder;

    .line 646
    .line 647
    invoke-static {v10, v9}, Lxq0;->a(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 648
    .line 649
    .line 650
    goto :goto_14

    .line 651
    :cond_19
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 652
    .line 653
    .line 654
    move-result v2

    .line 655
    if-lez v2, :cond_22

    .line 656
    .line 657
    iget-object v2, v1, Lgq0;->m:Landroid/os/Bundle;

    .line 658
    .line 659
    if-nez v2, :cond_1a

    .line 660
    .line 661
    new-instance v2, Landroid/os/Bundle;

    .line 662
    .line 663
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 664
    .line 665
    .line 666
    iput-object v2, v1, Lgq0;->m:Landroid/os/Bundle;

    .line 667
    .line 668
    :cond_1a
    const-string v4, "android.car.EXTENSIONS"

    .line 669
    .line 670
    invoke-virtual {v2, v4}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 671
    .line 672
    .line 673
    move-result-object v2

    .line 674
    if-nez v2, :cond_1b

    .line 675
    .line 676
    new-instance v2, Landroid/os/Bundle;

    .line 677
    .line 678
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 679
    .line 680
    .line 681
    :cond_1b
    new-instance v8, Landroid/os/Bundle;

    .line 682
    .line 683
    invoke-direct {v8, v2}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 684
    .line 685
    .line 686
    new-instance v9, Landroid/os/Bundle;

    .line 687
    .line 688
    invoke-direct {v9}, Landroid/os/Bundle;-><init>()V

    .line 689
    .line 690
    .line 691
    const/4 v10, 0x0

    .line 692
    :goto_15
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    .line 693
    .line 694
    .line 695
    move-result v11

    .line 696
    if-ge v10, v11, :cond_20

    .line 697
    .line 698
    invoke-static {v10}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 699
    .line 700
    .line 701
    move-result-object v11

    .line 702
    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 703
    .line 704
    .line 705
    move-result-object v12

    .line 706
    check-cast v12, Lbq0;

    .line 707
    .line 708
    new-instance v13, Landroid/os/Bundle;

    .line 709
    .line 710
    invoke-direct {v13}, Landroid/os/Bundle;-><init>()V

    .line 711
    .line 712
    .line 713
    iget-object v14, v12, Lbq0;->b:Landroidx/core/graphics/drawable/IconCompat;

    .line 714
    .line 715
    if-nez v14, :cond_1c

    .line 716
    .line 717
    iget v15, v12, Lbq0;->f:I

    .line 718
    .line 719
    if-eqz v15, :cond_1c

    .line 720
    .line 721
    const/4 v7, 0x0

    .line 722
    invoke-static {v7, v3, v15}, Landroidx/core/graphics/drawable/IconCompat;->c(Landroid/content/res/Resources;Ljava/lang/String;I)Landroidx/core/graphics/drawable/IconCompat;

    .line 723
    .line 724
    .line 725
    move-result-object v14

    .line 726
    iput-object v14, v12, Lbq0;->b:Landroidx/core/graphics/drawable/IconCompat;

    .line 727
    .line 728
    :cond_1c
    iget-object v7, v12, Lbq0;->a:Landroid/os/Bundle;

    .line 729
    .line 730
    if-eqz v14, :cond_1d

    .line 731
    .line 732
    invoke-virtual {v14}, Landroidx/core/graphics/drawable/IconCompat;->d()I

    .line 733
    .line 734
    .line 735
    move-result v14

    .line 736
    goto :goto_16

    .line 737
    :cond_1d
    const/4 v14, 0x0

    .line 738
    :goto_16
    const-string v15, "icon"

    .line 739
    .line 740
    invoke-virtual {v13, v15, v14}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 741
    .line 742
    .line 743
    const-string v14, "title"

    .line 744
    .line 745
    iget-object v15, v12, Lbq0;->g:Ljava/lang/CharSequence;

    .line 746
    .line 747
    invoke-virtual {v13, v14, v15}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 748
    .line 749
    .line 750
    const-string v14, "actionIntent"

    .line 751
    .line 752
    iget-object v15, v12, Lbq0;->h:Landroid/app/PendingIntent;

    .line 753
    .line 754
    invoke-virtual {v13, v14, v15}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    .line 755
    .line 756
    .line 757
    new-instance v14, Landroid/os/Bundle;

    .line 758
    .line 759
    invoke-direct {v14, v7}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 760
    .line 761
    .line 762
    const-string v7, "android.support.allowGeneratedReplies"

    .line 763
    .line 764
    iget-boolean v15, v12, Lbq0;->d:Z

    .line 765
    .line 766
    invoke-virtual {v14, v7, v15}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 767
    .line 768
    .line 769
    const-string v7, "extras"

    .line 770
    .line 771
    invoke-virtual {v13, v7, v14}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 772
    .line 773
    .line 774
    iget-object v7, v12, Lbq0;->c:[La01;

    .line 775
    .line 776
    if-nez v7, :cond_1e

    .line 777
    .line 778
    const/4 v14, 0x0

    .line 779
    goto :goto_17

    .line 780
    :cond_1e
    array-length v14, v7

    .line 781
    new-array v14, v14, [Landroid/os/Bundle;

    .line 782
    .line 783
    array-length v15, v7

    .line 784
    if-gtz v15, :cond_1f

    .line 785
    .line 786
    :goto_17
    const-string v7, "remoteInputs"

    .line 787
    .line 788
    invoke-virtual {v13, v7, v14}, Landroid/os/Bundle;->putParcelableArray(Ljava/lang/String;[Landroid/os/Parcelable;)V

    .line 789
    .line 790
    .line 791
    const-string v7, "showsUserInterface"

    .line 792
    .line 793
    iget-boolean v12, v12, Lbq0;->e:Z

    .line 794
    .line 795
    invoke-virtual {v13, v7, v12}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 796
    .line 797
    .line 798
    const-string v7, "semanticAction"

    .line 799
    .line 800
    const/4 v12, 0x0

    .line 801
    invoke-virtual {v13, v7, v12}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 802
    .line 803
    .line 804
    invoke-virtual {v9, v11, v13}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 805
    .line 806
    .line 807
    add-int/lit8 v10, v10, 0x1

    .line 808
    .line 809
    const/16 v7, 0x1c

    .line 810
    .line 811
    goto :goto_15

    .line 812
    :cond_1f
    const/4 v12, 0x0

    .line 813
    aget-object v0, v7, v12

    .line 814
    .line 815
    new-instance v0, Landroid/os/Bundle;

    .line 816
    .line 817
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 818
    .line 819
    .line 820
    const/16 v18, 0x0

    .line 821
    .line 822
    throw v18

    .line 823
    :cond_20
    const-string v3, "invisible_actions"

    .line 824
    .line 825
    invoke-virtual {v2, v3, v9}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 826
    .line 827
    .line 828
    invoke-virtual {v8, v3, v9}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 829
    .line 830
    .line 831
    iget-object v3, v1, Lgq0;->m:Landroid/os/Bundle;

    .line 832
    .line 833
    if-nez v3, :cond_21

    .line 834
    .line 835
    new-instance v3, Landroid/os/Bundle;

    .line 836
    .line 837
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 838
    .line 839
    .line 840
    iput-object v3, v1, Lgq0;->m:Landroid/os/Bundle;

    .line 841
    .line 842
    :cond_21
    invoke-virtual {v3, v4, v2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 843
    .line 844
    .line 845
    iget-object v2, v0, Ler0;->n:Ljava/lang/Object;

    .line 846
    .line 847
    check-cast v2, Landroid/os/Bundle;

    .line 848
    .line 849
    invoke-virtual {v2, v4, v8}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 850
    .line 851
    .line 852
    :cond_22
    iget-object v2, v0, Ler0;->l:Ljava/lang/Object;

    .line 853
    .line 854
    check-cast v2, Landroid/app/Notification$Builder;

    .line 855
    .line 856
    iget-object v3, v1, Lgq0;->m:Landroid/os/Bundle;

    .line 857
    .line 858
    invoke-virtual {v2, v3}, Landroid/app/Notification$Builder;->setExtras(Landroid/os/Bundle;)Landroid/app/Notification$Builder;

    .line 859
    .line 860
    .line 861
    iget-object v2, v0, Ler0;->l:Ljava/lang/Object;

    .line 862
    .line 863
    check-cast v2, Landroid/app/Notification$Builder;

    .line 864
    .line 865
    const/4 v3, 0x0

    .line 866
    invoke-static {v2, v3}, Lzq0;->e(Landroid/app/Notification$Builder;[Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 867
    .line 868
    .line 869
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 870
    .line 871
    const/16 v4, 0x1a

    .line 872
    .line 873
    if-lt v2, v4, :cond_24

    .line 874
    .line 875
    iget-object v4, v0, Ler0;->l:Ljava/lang/Object;

    .line 876
    .line 877
    check-cast v4, Landroid/app/Notification$Builder;

    .line 878
    .line 879
    const/4 v7, 0x0

    .line 880
    invoke-static {v4, v7}, Lar0;->b(Landroid/app/Notification$Builder;I)Landroid/app/Notification$Builder;

    .line 881
    .line 882
    .line 883
    iget-object v4, v0, Ler0;->l:Ljava/lang/Object;

    .line 884
    .line 885
    check-cast v4, Landroid/app/Notification$Builder;

    .line 886
    .line 887
    invoke-static {v4, v3}, Lar0;->e(Landroid/app/Notification$Builder;Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    .line 888
    .line 889
    .line 890
    iget-object v4, v0, Ler0;->l:Ljava/lang/Object;

    .line 891
    .line 892
    check-cast v4, Landroid/app/Notification$Builder;

    .line 893
    .line 894
    invoke-static {v4, v3}, Lar0;->f(Landroid/app/Notification$Builder;Ljava/lang/String;)Landroid/app/Notification$Builder;

    .line 895
    .line 896
    .line 897
    iget-object v3, v0, Ler0;->l:Ljava/lang/Object;

    .line 898
    .line 899
    check-cast v3, Landroid/app/Notification$Builder;

    .line 900
    .line 901
    const-wide/16 v6, 0x0

    .line 902
    .line 903
    invoke-static {v3, v6, v7}, Lar0;->g(Landroid/app/Notification$Builder;J)Landroid/app/Notification$Builder;

    .line 904
    .line 905
    .line 906
    iget-object v3, v0, Ler0;->l:Ljava/lang/Object;

    .line 907
    .line 908
    check-cast v3, Landroid/app/Notification$Builder;

    .line 909
    .line 910
    const/4 v7, 0x0

    .line 911
    invoke-static {v3, v7}, Lar0;->d(Landroid/app/Notification$Builder;I)Landroid/app/Notification$Builder;

    .line 912
    .line 913
    .line 914
    iget-object v3, v1, Lgq0;->o:Ljava/lang/String;

    .line 915
    .line 916
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 917
    .line 918
    .line 919
    move-result v3

    .line 920
    if-nez v3, :cond_23

    .line 921
    .line 922
    iget-object v3, v0, Ler0;->l:Ljava/lang/Object;

    .line 923
    .line 924
    check-cast v3, Landroid/app/Notification$Builder;

    .line 925
    .line 926
    const/4 v4, 0x0

    .line 927
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setSound(Landroid/net/Uri;)Landroid/app/Notification$Builder;

    .line 928
    .line 929
    .line 930
    move-result-object v3

    .line 931
    invoke-virtual {v3, v7}, Landroid/app/Notification$Builder;->setDefaults(I)Landroid/app/Notification$Builder;

    .line 932
    .line 933
    .line 934
    move-result-object v3

    .line 935
    invoke-virtual {v3, v7, v7, v7}, Landroid/app/Notification$Builder;->setLights(III)Landroid/app/Notification$Builder;

    .line 936
    .line 937
    .line 938
    move-result-object v3

    .line 939
    invoke-virtual {v3, v4}, Landroid/app/Notification$Builder;->setVibrate([J)Landroid/app/Notification$Builder;

    .line 940
    .line 941
    .line 942
    :cond_23
    :goto_18
    const/16 v3, 0x1c

    .line 943
    .line 944
    goto :goto_19

    .line 945
    :cond_24
    const/4 v7, 0x0

    .line 946
    goto :goto_18

    .line 947
    :goto_19
    if-lt v2, v3, :cond_25

    .line 948
    .line 949
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    .line 950
    .line 951
    .line 952
    move-result v2

    .line 953
    :goto_1a
    if-ge v7, v2, :cond_25

    .line 954
    .line 955
    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 956
    .line 957
    .line 958
    move-result-object v3

    .line 959
    add-int/lit8 v7, v7, 0x1

    .line 960
    .line 961
    check-cast v3, Let0;

    .line 962
    .line 963
    iget-object v4, v0, Ler0;->l:Ljava/lang/Object;

    .line 964
    .line 965
    check-cast v4, Landroid/app/Notification$Builder;

    .line 966
    .line 967
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 968
    .line 969
    .line 970
    invoke-static {v3}, Ldt0;->b(Let0;)Landroid/app/Person;

    .line 971
    .line 972
    .line 973
    move-result-object v3

    .line 974
    invoke-static {v4, v3}, Lbr0;->a(Landroid/app/Notification$Builder;Landroid/app/Person;)Landroid/app/Notification$Builder;

    .line 975
    .line 976
    .line 977
    goto :goto_1a

    .line 978
    :cond_25
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 979
    .line 980
    const/16 v3, 0x1d

    .line 981
    .line 982
    if-lt v2, v3, :cond_26

    .line 983
    .line 984
    iget-object v2, v0, Ler0;->l:Ljava/lang/Object;

    .line 985
    .line 986
    check-cast v2, Landroid/app/Notification$Builder;

    .line 987
    .line 988
    iget-boolean v1, v1, Lgq0;->p:Z

    .line 989
    .line 990
    invoke-static {v2, v1}, Lcr0;->a(Landroid/app/Notification$Builder;Z)Landroid/app/Notification$Builder;

    .line 991
    .line 992
    .line 993
    iget-object v0, v0, Ler0;->l:Ljava/lang/Object;

    .line 994
    .line 995
    check-cast v0, Landroid/app/Notification$Builder;

    .line 996
    .line 997
    const/4 v3, 0x0

    .line 998
    invoke-static {v0, v3}, Lcr0;->b(Landroid/app/Notification$Builder;Landroid/app/Notification$BubbleMetadata;)Landroid/app/Notification$Builder;

    .line 999
    .line 1000
    .line 1001
    :cond_26
    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 1002
    iput p5, p0, Ler0;->j:I

    iput-object p1, p0, Ler0;->k:Ljava/lang/Object;

    iput-object p2, p0, Ler0;->l:Ljava/lang/Object;

    iput-object p3, p0, Ler0;->m:Ljava/lang/Object;

    iput-object p4, p0, Ler0;->n:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lvz1;Ljava/lang/String;)V
    .locals 1

    const/16 v0, 0x13

    iput v0, p0, Ler0;->j:I

    .line 1006
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ler0;->m:Ljava/lang/Object;

    .line 1007
    invoke-static {p2}, Lbh;->e(Ljava/lang/String;)V

    iput-object p2, p0, Ler0;->k:Ljava/lang/Object;

    new-instance p1, Landroid/os/Bundle;

    .line 1008
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    iput-object p1, p0, Ler0;->n:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lwu;Ljava/util/List;)V
    .locals 1

    const/4 v0, 0x3

    iput v0, p0, Ler0;->j:I

    .line 1073
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1074
    iput-object p1, p0, Ler0;->n:Ljava/lang/Object;

    .line 1075
    invoke-static {}, Lbv;->a()Lzo0;

    move-result-object p1

    iput-object p1, p0, Ler0;->k:Ljava/lang/Object;

    .line 1076
    new-instance p1, Lnl;

    const/4 v0, 0x1

    .line 1077
    invoke-direct {p1, v0}, Lng0;-><init>(Z)V

    const/4 v0, 0x0

    .line 1078
    invoke-virtual {p1, v0}, Lng0;->D(Lng0;)V

    .line 1079
    iput-object p1, p0, Ler0;->l:Ljava/lang/Object;

    .line 1080
    invoke-static {p2}, Lbl;->F(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Ler0;->m:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lzq;Ltu;Loj;)V
    .locals 2

    const/16 v0, 0xc

    iput v0, p0, Ler0;->j:I

    .line 1009
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 1010
    iput-object p1, p0, Ler0;->k:Ljava/lang/Object;

    .line 1011
    iput-object p3, p0, Ler0;->l:Ljava/lang/Object;

    const p3, 0x7fffffff

    const/4 v0, 0x0

    const/4 v1, 0x6

    .line 1012
    invoke-static {p3, v0, v1}, Les0;->a(ILfh;I)Lhh;

    move-result-object p3

    iput-object p3, p0, Ler0;->m:Ljava/lang/Object;

    .line 1013
    new-instance p3, Lbv1;

    invoke-direct {p3, v1}, Lbv1;-><init>(I)V

    iput-object p3, p0, Ler0;->n:Ljava/lang/Object;

    .line 1014
    invoke-interface {p1}, Lzq;->a()Lsq;

    move-result-object p1

    sget-object p3, Ltb0;->n:Ltb0;

    invoke-interface {p1, p3}, Lsq;->j(Lrq;)Lqq;

    move-result-object p1

    check-cast p1, Lng0;

    if-eqz p1, :cond_0

    new-instance p3, Lpq;

    const/4 v0, 0x3

    invoke-direct {p3, p2, v0, p0}, Lpq;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    .line 1015
    new-instance p0, Lvf0;

    invoke-direct {p0, p3}, Lvf0;-><init>(Lr80;)V

    const/4 p2, 0x1

    .line 1016
    invoke-virtual {p1, p2, p0}, Lng0;->E(ZLjg0;)Liy;

    :cond_0
    return-void
.end method

.method public synthetic constructor <init>(Z)V
    .locals 0

    .line 1003
    const/16 p1, 0xa

    iput p1, p0, Ler0;->j:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public A(Ljava/lang/String;Lst1;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ler0;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Ler0;->k:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v1, Ler0;

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1, p1}, Ler0;->z(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1, p1, p2}, Ler0;->A(Ljava/lang/String;Lst1;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    iget-object p0, p0, Ler0;->n:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p0, Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_1

    .line 36
    .line 37
    return-void

    .line 38
    :cond_1
    if-nez p2, :cond_2

    .line 39
    .line 40
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :cond_2
    invoke-virtual {v0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    return-void
.end method

.method public B(Ljava/lang/String;Lst1;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ler0;->n:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Ler0;->m:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Ljava/util/HashMap;

    .line 15
    .line 16
    if-nez p2, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public C(Ljava/lang/String;)Lst1;
    .locals 2

    .line 1
    iget-object v0, p0, Ler0;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Lst1;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    iget-object p0, p0, Ler0;->k:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Ler0;

    .line 21
    .line 22
    if-eqz p0, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p1}, Ler0;->C(Ljava/lang/String;)Lst1;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 30
    .line 31
    new-instance v0, Ljava/lang/StringBuilder;

    .line 32
    .line 33
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p1, " is not defined"

    .line 40
    .line 41
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw p0
.end method

.method public a(Lbq0;)V
    .locals 8

    .line 1
    iget-object v0, p1, Lbq0;->b:Landroidx/core/graphics/drawable/IconCompat;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget v2, p1, Lbq0;->f:I

    .line 7
    .line 8
    if-eqz v2, :cond_0

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    invoke-static {v1, v0, v2}, Landroidx/core/graphics/drawable/IconCompat;->c(Landroid/content/res/Resources;Ljava/lang/String;I)Landroidx/core/graphics/drawable/IconCompat;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iput-object v0, p1, Lbq0;->b:Landroidx/core/graphics/drawable/IconCompat;

    .line 17
    .line 18
    :cond_0
    iget-boolean v2, p1, Lbq0;->d:Z

    .line 19
    .line 20
    iget-object v3, p1, Lbq0;->a:Landroid/os/Bundle;

    .line 21
    .line 22
    if-eqz v0, :cond_1

    .line 23
    .line 24
    invoke-static {v0, v1}, Lld0;->g(Landroidx/core/graphics/drawable/IconCompat;Landroid/content/Context;)Landroid/graphics/drawable/Icon;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    goto :goto_0

    .line 29
    :cond_1
    move-object v0, v1

    .line 30
    :goto_0
    iget-object v4, p1, Lbq0;->g:Ljava/lang/CharSequence;

    .line 31
    .line 32
    iget-object v5, p1, Lbq0;->h:Landroid/app/PendingIntent;

    .line 33
    .line 34
    invoke-static {v0, v4, v5}, Lyq0;->a(Landroid/graphics/drawable/Icon;Ljava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Action$Builder;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v4, p1, Lbq0;->c:[La01;

    .line 39
    .line 40
    const/4 v5, 0x0

    .line 41
    if-eqz v4, :cond_3

    .line 42
    .line 43
    array-length v6, v4

    .line 44
    new-array v6, v6, [Landroid/app/RemoteInput;

    .line 45
    .line 46
    array-length v7, v4

    .line 47
    if-gtz v7, :cond_2

    .line 48
    .line 49
    array-length v1, v6

    .line 50
    move v4, v5

    .line 51
    :goto_1
    if-ge v4, v1, :cond_3

    .line 52
    .line 53
    aget-object v7, v6, v4

    .line 54
    .line 55
    invoke-static {v0, v7}, Lwq0;->c(Landroid/app/Notification$Action$Builder;Landroid/app/RemoteInput;)Landroid/app/Notification$Action$Builder;

    .line 56
    .line 57
    .line 58
    add-int/lit8 v4, v4, 0x1

    .line 59
    .line 60
    goto :goto_1

    .line 61
    :cond_2
    aget-object p0, v4, v5

    .line 62
    .line 63
    new-instance p0, Landroid/app/RemoteInput$Builder;

    .line 64
    .line 65
    throw v1

    .line 66
    :cond_3
    new-instance v1, Landroid/os/Bundle;

    .line 67
    .line 68
    invoke-direct {v1, v3}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 69
    .line 70
    .line 71
    const-string v3, "android.support.allowGeneratedReplies"

    .line 72
    .line 73
    invoke-virtual {v1, v3, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 74
    .line 75
    .line 76
    invoke-static {v0, v2}, Lzq0;->a(Landroid/app/Notification$Action$Builder;Z)Landroid/app/Notification$Action$Builder;

    .line 77
    .line 78
    .line 79
    const-string v2, "android.support.action.semanticAction"

    .line 80
    .line 81
    invoke-virtual {v1, v2, v5}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 82
    .line 83
    .line 84
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 85
    .line 86
    const/16 v3, 0x1c

    .line 87
    .line 88
    if-lt v2, v3, :cond_4

    .line 89
    .line 90
    invoke-static {v0, v5}, Lbr0;->b(Landroid/app/Notification$Action$Builder;I)Landroid/app/Notification$Action$Builder;

    .line 91
    .line 92
    .line 93
    :cond_4
    const/16 v3, 0x1d

    .line 94
    .line 95
    if-lt v2, v3, :cond_5

    .line 96
    .line 97
    invoke-static {v0, v5}, Lcr0;->c(Landroid/app/Notification$Action$Builder;Z)Landroid/app/Notification$Action$Builder;

    .line 98
    .line 99
    .line 100
    :cond_5
    const/16 v3, 0x1f

    .line 101
    .line 102
    if-lt v2, v3, :cond_6

    .line 103
    .line 104
    invoke-static {v0, v5}, Ldr0;->a(Landroid/app/Notification$Action$Builder;Z)Landroid/app/Notification$Action$Builder;

    .line 105
    .line 106
    .line 107
    :cond_6
    const-string v2, "android.support.action.showsUserInterface"

    .line 108
    .line 109
    iget-boolean p1, p1, Lbq0;->e:Z

    .line 110
    .line 111
    invoke-virtual {v1, v2, p1}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 112
    .line 113
    .line 114
    invoke-static {v0, v1}, Lwq0;->b(Landroid/app/Notification$Action$Builder;Landroid/os/Bundle;)Landroid/app/Notification$Action$Builder;

    .line 115
    .line 116
    .line 117
    iget-object p0, p0, Ler0;->l:Ljava/lang/Object;

    .line 118
    .line 119
    check-cast p0, Landroid/app/Notification$Builder;

    .line 120
    .line 121
    invoke-static {v0}, Lwq0;->d(Landroid/app/Notification$Action$Builder;)Landroid/app/Notification$Action;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    invoke-static {p0, p1}, Lwq0;->a(Landroid/app/Notification$Builder;Landroid/app/Notification$Action;)Landroid/app/Notification$Builder;

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public b(Lh70;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ler0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object v0, p0, Ler0;->k:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast v0, Ljava/util/ArrayList;

    .line 14
    .line 15
    monitor-enter v0

    .line 16
    :try_start_0
    iget-object p0, p0, Ler0;->k:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p0, Ljava/util/ArrayList;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    const/4 p0, 0x1

    .line 25
    iput-boolean p0, p1, Lh70;->t:Z

    .line 26
    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw p0

    .line 31
    :cond_0
    const-string p0, "Fragment already added: "

    .line 32
    .line 33
    invoke-static {p1, p0}, Lwd1;->e(Ljava/lang/Object;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public c()Lm01;
    .locals 7

    .line 1
    iget-object v0, p0, Ler0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v2, v0

    .line 4
    check-cast v2, Led0;

    .line 5
    .line 6
    if-eqz v2, :cond_1

    .line 7
    .line 8
    iget-object v0, p0, Ler0;->l:Ljava/lang/Object;

    .line 9
    .line 10
    move-object v3, v0

    .line 11
    check-cast v3, Ljava/lang/String;

    .line 12
    .line 13
    iget-object v0, p0, Ler0;->m:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Lrb0;

    .line 16
    .line 17
    invoke-virtual {v0}, Lrb0;->c()Lsb0;

    .line 18
    .line 19
    .line 20
    move-result-object v4

    .line 21
    iget-object p0, p0, Ler0;->n:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p0, Ljava/util/LinkedHashMap;

    .line 24
    .line 25
    sget-object v0, Ljg1;->a:[B

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    invoke-interface {p0}, Ljava/util/Map;->isEmpty()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    sget-object p0, Lv00;->j:Lv00;

    .line 37
    .line 38
    :goto_0
    move-object v6, p0

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 41
    .line 42
    invoke-direct {v0, p0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    .line 43
    .line 44
    .line 45
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :goto_1
    new-instance v1, Lm01;

    .line 54
    .line 55
    const/4 v5, 0x0

    .line 56
    invoke-direct/range {v1 .. v6}, Lm01;-><init>(Led0;Ljava/lang/String;Lsb0;Lkp1;Ljava/util/Map;)V

    .line 57
    .line 58
    .line 59
    return-object v1

    .line 60
    :cond_1
    const-string p0, "url == null"

    .line 61
    .line 62
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const/4 p0, 0x0

    .line 66
    return-object p0
.end method

.method public d(Lkq;)Ljava/lang/Object;
    .locals 6

    .line 1
    iget-object v0, p0, Ler0;->n:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lwu;

    .line 4
    .line 5
    instance-of v1, p1, Lzt;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    move-object v1, p1

    .line 10
    check-cast v1, Lzt;

    .line 11
    .line 12
    iget v2, v1, Lzt;->p:I

    .line 13
    .line 14
    const/high16 v3, -0x80000000

    .line 15
    .line 16
    and-int v4, v2, v3

    .line 17
    .line 18
    if-eqz v4, :cond_0

    .line 19
    .line 20
    sub-int/2addr v2, v3

    .line 21
    iput v2, v1, Lzt;->p:I

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    new-instance v1, Lzt;

    .line 25
    .line 26
    invoke-direct {v1, p0, p1}, Lzt;-><init>(Ler0;Lkq;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object p1, v1, Lzt;->n:Ljava/lang/Object;

    .line 30
    .line 31
    iget v2, v1, Lzt;->p:I

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    const/4 v4, 0x2

    .line 35
    const/4 v5, 0x1

    .line 36
    if-eqz v2, :cond_3

    .line 37
    .line 38
    if-eq v2, v5, :cond_2

    .line 39
    .line 40
    if-ne v2, v4, :cond_1

    .line 41
    .line 42
    iget-object p0, v1, Lzt;->m:Ler0;

    .line 43
    .line 44
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 49
    .line 50
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return-object v3

    .line 54
    :cond_2
    iget-object p0, v1, Lzt;->m:Ler0;

    .line 55
    .line 56
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    goto :goto_4

    .line 60
    :cond_3
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Ler0;->m:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast p1, Ljava/util/List;

    .line 66
    .line 67
    sget-object v2, Lar;->j:Lar;

    .line 68
    .line 69
    if-eqz p1, :cond_6

    .line 70
    .line 71
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    if-eqz p1, :cond_4

    .line 76
    .line 77
    goto :goto_2

    .line 78
    :cond_4
    invoke-virtual {v0}, Lwu;->c()Lef0;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    new-instance v5, Lcu;

    .line 83
    .line 84
    invoke-direct {v5, v0, p0, v3}, Lcu;-><init>(Lwu;Ler0;Liq;)V

    .line 85
    .line 86
    .line 87
    iput-object p0, v1, Lzt;->m:Ler0;

    .line 88
    .line 89
    iput v4, v1, Lzt;->p:I

    .line 90
    .line 91
    invoke-interface {p1, v5, v1}, Lef0;->a(Lr80;Lkq;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    if-ne p1, v2, :cond_5

    .line 96
    .line 97
    goto :goto_3

    .line 98
    :cond_5
    :goto_1
    check-cast p1, Lpt;

    .line 99
    .line 100
    goto :goto_5

    .line 101
    :cond_6
    :goto_2
    iput-object p0, v1, Lzt;->m:Ler0;

    .line 102
    .line 103
    iput v5, v1, Lzt;->p:I

    .line 104
    .line 105
    const/4 p1, 0x0

    .line 106
    invoke-virtual {v0, p1, v1}, Lwu;->h(ZLkq;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object p1

    .line 110
    if-ne p1, v2, :cond_7

    .line 111
    .line 112
    :goto_3
    return-object v2

    .line 113
    :cond_7
    :goto_4
    check-cast p1, Lpt;

    .line 114
    .line 115
    :goto_5
    iget-object p0, p0, Ler0;->n:Ljava/lang/Object;

    .line 116
    .line 117
    check-cast p0, Lwu;

    .line 118
    .line 119
    iget-object p0, p0, Lwu;->h:Lbv1;

    .line 120
    .line 121
    invoke-virtual {p0, p1}, Lbv1;->r(Lr91;)V

    .line 122
    .line 123
    .line 124
    sget-object p0, Lwe1;->a:Lwe1;

    .line 125
    .line 126
    return-object p0
.end method

.method public e(Ljava/lang/String;)Lh70;
    .locals 0

    .line 1
    iget-object p0, p0, Ler0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Landroidx/fragment/app/a;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Landroidx/fragment/app/a;->c:Lh70;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public f(Ljava/lang/String;)Lh70;
    .locals 2

    .line 1
    iget-object p0, p0, Ler0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Landroidx/fragment/app/a;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, v0, Landroidx/fragment/app/a;->c:Lh70;

    .line 28
    .line 29
    iget-object v1, v0, Lh70;->n:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-object v0, v0, Lh70;->C:Lz70;

    .line 39
    .line 40
    iget-object v0, v0, Lz70;->c:Ler0;

    .line 41
    .line 42
    invoke-virtual {v0, p1}, Ler0;->f(Ljava/lang/String;)Lh70;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    :goto_0
    if-eqz v0, :cond_0

    .line 47
    .line 48
    return-object v0

    .line 49
    :cond_2
    const/4 p0, 0x0

    .line 50
    return-object p0
.end method

.method public g(Ljava/util/ArrayDeque;Ljava/lang/Object;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p1, p2}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    .line 3
    .line 4
    .line 5
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    invoke-virtual {p0}, Ler0;->r()V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/AssertionError;

    .line 14
    .line 15
    const-string p2, "Call wasn\'t in-flight!"

    .line 16
    .line 17
    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    :catchall_0
    move-exception p1

    .line 22
    monitor-exit p0

    .line 23
    throw p1
.end method

.method public get()Ljava/lang/Object;
    .locals 7

    .line 1
    iget v0, p0, Ler0;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ler0;->k:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Lkw0;

    .line 9
    .line 10
    invoke-interface {v0}, Lkw0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    move-object v2, v0

    .line 15
    check-cast v2, Ljava/util/concurrent/Executor;

    .line 16
    .line 17
    iget-object v0, p0, Ler0;->l:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v0, Lkw0;

    .line 20
    .line 21
    invoke-interface {v0}, Lkw0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    move-object v3, v0

    .line 26
    check-cast v3, Lh21;

    .line 27
    .line 28
    iget-object v0, p0, Ler0;->m:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v0, Lc9;

    .line 31
    .line 32
    invoke-virtual {v0}, Lc9;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    move-object v4, v0

    .line 37
    check-cast v4, Lc9;

    .line 38
    .line 39
    iget-object p0, p0, Ler0;->n:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast p0, Lkw0;

    .line 42
    .line 43
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    move-object v5, p0

    .line 48
    check-cast v5, Lh21;

    .line 49
    .line 50
    new-instance v1, Ler0;

    .line 51
    .line 52
    const/16 v6, 0xf

    .line 53
    .line 54
    invoke-direct/range {v1 .. v6}, Ler0;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 55
    .line 56
    .line 57
    return-object v1

    .line 58
    :pswitch_0
    iget-object v0, p0, Ler0;->k:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast v0, Lbv1;

    .line 61
    .line 62
    iget-object v0, v0, Lbv1;->k:Ljava/lang/Object;

    .line 63
    .line 64
    check-cast v0, Lu30;

    .line 65
    .line 66
    iget-object v1, p0, Ler0;->l:Ljava/lang/Object;

    .line 67
    .line 68
    check-cast v1, Ljw0;

    .line 69
    .line 70
    invoke-interface {v1}, Lkw0;->get()Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    check-cast v1, Ll51;

    .line 75
    .line 76
    iget-object v2, p0, Ler0;->m:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v2, Ljw0;

    .line 79
    .line 80
    invoke-interface {v2}, Lkw0;->get()Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    check-cast v2, Lsq;

    .line 85
    .line 86
    iget-object p0, p0, Ler0;->n:Ljava/lang/Object;

    .line 87
    .line 88
    check-cast p0, Ljw0;

    .line 89
    .line 90
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    check-cast p0, Lj51;

    .line 95
    .line 96
    new-instance v3, Lf50;

    .line 97
    .line 98
    invoke-direct {v3, v0, v1, v2, p0}, Lf50;-><init>(Lu30;Ll51;Lsq;Lj51;)V

    .line 99
    .line 100
    .line 101
    return-object v3

    .line 102
    nop

    .line 103
    :pswitch_data_0
    .packed-switch 0x7
        :pswitch_0
    .end packed-switch
.end method

.method public h(Ltx0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ltx0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ler0;->m:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast v0, Ljava/util/ArrayDeque;

    .line 9
    .line 10
    invoke-virtual {p0, v0, p1}, Ler0;->g(Ljava/util/ArrayDeque;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public i(Ly2;)Lwa1;
    .locals 5

    .line 1
    iget-object v0, p0, Ler0;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    const/4 v2, 0x0

    .line 10
    :goto_0
    if-ge v2, v1, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    check-cast v3, Lwa1;

    .line 17
    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    iget-object v4, v3, Lwa1;->b:Ly2;

    .line 21
    .line 22
    if-ne v4, p1, :cond_0

    .line 23
    .line 24
    return-object v3

    .line 25
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    new-instance v1, Lwa1;

    .line 29
    .line 30
    iget-object p0, p0, Ler0;->k:Ljava/lang/Object;

    .line 31
    .line 32
    check-cast p0, Landroid/content/Context;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1}, Lwa1;-><init>(Landroid/content/Context;Ly2;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    return-object v1
.end method

.method public j()Ljava/util/ArrayList;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ler0;->l:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Landroidx/fragment/app/a;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return-object v0
.end method

.method public k()Ljava/util/ArrayList;
    .locals 2

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Ler0;->l:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    if-eqz v1, :cond_1

    .line 23
    .line 24
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    check-cast v1, Landroidx/fragment/app/a;

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-object v1, v1, Landroidx/fragment/app/a;->c:Lh70;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_0
    const/4 v1, 0x0

    .line 39
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    return-object v0
.end method

.method public l()Ljava/util/List;
    .locals 2

    .line 1
    iget-object v0, p0, Ler0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    iget-object v0, p0, Ler0;->k:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    monitor-enter v0

    .line 19
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    .line 20
    .line 21
    iget-object p0, p0, Ler0;->k:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast p0, Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 26
    .line 27
    .line 28
    monitor-exit v0

    .line 29
    return-object v1

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0
.end method

.method public m(Landroidx/fragment/app/a;)V
    .locals 2

    .line 1
    iget-object v0, p1, Landroidx/fragment/app/a;->c:Lh70;

    .line 2
    .line 3
    iget-object v1, v0, Lh70;->n:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ler0;->l:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-virtual {p0, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    iget-object v1, v0, Lh70;->n:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0, v1, p1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x2

    .line 22
    invoke-static {p0}, Lz70;->F(I)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    invoke-virtual {v0}, Lh70;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    :cond_1
    return-void
.end method

.method public n(Landroidx/fragment/app/a;)V
    .locals 2

    .line 1
    iget-object p1, p1, Landroidx/fragment/app/a;->c:Lh70;

    .line 2
    .line 3
    iget-boolean v0, p1, Lh70;->J:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ler0;->n:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v0, Lb80;

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Lb80;->c(Lh70;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p0, Ler0;->l:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p0, Ljava/util/HashMap;

    .line 17
    .line 18
    iget-object v0, p1, Lh70;->n:Ljava/lang/String;

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    invoke-virtual {p0, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    check-cast p0, Landroidx/fragment/app/a;

    .line 26
    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    const/4 p0, 0x2

    .line 31
    invoke-static {p0}, Lz70;->F(I)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    invoke-virtual {p1}, Lh70;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    :cond_2
    :goto_0
    return-void
.end method

.method public o(Ljava/lang/String;Lkp1;)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result p2

    .line 8
    if-lez p2, :cond_1

    .line 9
    .line 10
    const-string p2, "POST"

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    if-nez p2, :cond_0

    .line 17
    .line 18
    const-string p2, "PUT"

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p2

    .line 24
    if-nez p2, :cond_0

    .line 25
    .line 26
    const-string p2, "PATCH"

    .line 27
    .line 28
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p2

    .line 32
    if-nez p2, :cond_0

    .line 33
    .line 34
    const-string p2, "PROPPATCH"

    .line 35
    .line 36
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result p2

    .line 40
    if-nez p2, :cond_0

    .line 41
    .line 42
    const-string p2, "REPORT"

    .line 43
    .line 44
    invoke-virtual {p1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    if-nez p2, :cond_0

    .line 49
    .line 50
    iput-object p1, p0, Ler0;->l:Ljava/lang/Object;

    .line 51
    .line 52
    return-void

    .line 53
    :cond_0
    const-string p0, " must have a request body."

    .line 54
    .line 55
    const-string p2, "method "

    .line 56
    .line 57
    invoke-static {p2, p1, p0}, Loq;->j(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {p0}, Lz0;->b(Ljava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_1
    const-string p0, "method.isEmpty() == true"

    .line 66
    .line 67
    invoke-static {p0}, Lz0;->d(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public onCancel()V
    .locals 2

    .line 1
    iget-object v0, p0, Ler0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/View;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/View;->clearAnimation()V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ler0;->l:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v1, Landroid/view/ViewGroup;

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->endViewTransition(Landroid/view/View;)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ler0;->m:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast v0, Lfw;

    .line 18
    .line 19
    invoke-virtual {v0}, Ld7;->d()V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x2

    .line 23
    invoke-static {v0}, Lz70;->F(I)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Ler0;->n:Ljava/lang/Object;

    .line 30
    .line 31
    check-cast p0, Lw81;

    .line 32
    .line 33
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    :cond_0
    return-void
.end method

.method public p(Ly2;Landroid/view/MenuItem;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ler0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/ActionMode$Callback;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ler0;->i(Ly2;)Lwa1;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    new-instance v1, Lzm0;

    .line 10
    .line 11
    iget-object p0, p0, Ler0;->k:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Landroid/content/Context;

    .line 14
    .line 15
    check-cast p2, Lbb1;

    .line 16
    .line 17
    invoke-direct {v1, p0, p2}, Lzm0;-><init>(Landroid/content/Context;Lbb1;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {v0, p1, v1}, Landroid/view/ActionMode$Callback;->onActionItemClicked(Landroid/view/ActionMode;Landroid/view/MenuItem;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    return p0
.end method

.method public q(Ly2;Lrm0;)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ler0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/view/ActionMode$Callback;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ler0;->i(Ly2;)Lwa1;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object v1, p0, Ler0;->n:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v1, Lu71;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v1, p2, v2}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    check-cast v2, Landroid/view/Menu;

    .line 19
    .line 20
    if-nez v2, :cond_0

    .line 21
    .line 22
    new-instance v2, Lln0;

    .line 23
    .line 24
    iget-object p0, p0, Ler0;->k:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast p0, Landroid/content/Context;

    .line 27
    .line 28
    invoke-direct {v2, p0, p2}, Lln0;-><init>(Landroid/content/Context;Lrm0;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1, p2, v2}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-interface {v0, p1, v2}, Landroid/view/ActionMode$Callback;->onCreateActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    return p0
.end method

.method public r()V
    .locals 14

    .line 1
    sget-object v0, Ljg1;->a:[B

    .line 2
    .line 3
    new-instance v1, Ljava/util/ArrayList;

    .line 4
    .line 5
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 6
    .line 7
    .line 8
    monitor-enter p0

    .line 9
    :try_start_0
    iget-object v0, p0, Ler0;->l:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Ljava/util/ArrayDeque;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 18
    .line 19
    .line 20
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    if-eqz v2, :cond_1

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    check-cast v2, Ltx0;

    .line 31
    .line 32
    iget-object v3, p0, Ler0;->m:Ljava/lang/Object;

    .line 33
    .line 34
    check-cast v3, Ljava/util/ArrayDeque;

    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->size()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    const/16 v4, 0x40

    .line 41
    .line 42
    if-ge v3, v4, :cond_1

    .line 43
    .line 44
    iget-object v3, v2, Ltx0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 45
    .line 46
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    const/4 v4, 0x5

    .line 51
    if-ge v3, v4, :cond_0

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 54
    .line 55
    .line 56
    iget-object v3, v2, Ltx0;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 57
    .line 58
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    iget-object v3, p0, Ler0;->m:Ljava/lang/Object;

    .line 65
    .line 66
    check-cast v3, Ljava/util/ArrayDeque;

    .line 67
    .line 68
    invoke-virtual {v3, v2}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :catchall_0
    move-exception v0

    .line 73
    goto/16 :goto_6

    .line 74
    .line 75
    :cond_1
    monitor-enter p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 76
    :try_start_1
    iget-object v0, p0, Ler0;->m:Ljava/lang/Object;

    .line 77
    .line 78
    check-cast v0, Ljava/util/ArrayDeque;

    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->size()I

    .line 81
    .line 82
    .line 83
    iget-object v0, p0, Ler0;->n:Ljava/lang/Object;

    .line 84
    .line 85
    check-cast v0, Ljava/util/ArrayDeque;

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->size()I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 88
    .line 89
    .line 90
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 91
    monitor-exit p0

    .line 92
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    const/4 v3, 0x0

    .line 97
    move v4, v3

    .line 98
    :goto_1
    if-ge v4, v2, :cond_3

    .line 99
    .line 100
    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    move-object v5, v0

    .line 105
    check-cast v5, Ltx0;

    .line 106
    .line 107
    monitor-enter p0

    .line 108
    :try_start_3
    iget-object v0, p0, Ler0;->k:Ljava/lang/Object;

    .line 109
    .line 110
    check-cast v0, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 111
    .line 112
    if-nez v0, :cond_2

    .line 113
    .line 114
    new-instance v6, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 115
    .line 116
    sget-object v11, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 117
    .line 118
    new-instance v12, Ljava/util/concurrent/SynchronousQueue;

    .line 119
    .line 120
    invoke-direct {v12}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    .line 121
    .line 122
    .line 123
    new-instance v0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 126
    .line 127
    .line 128
    sget-object v7, Ljg1;->f:Ljava/lang/String;

    .line 129
    .line 130
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    const-string v7, " Dispatcher"

    .line 134
    .line 135
    invoke-virtual {v0, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 136
    .line 137
    .line 138
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    new-instance v13, Lig1;

    .line 143
    .line 144
    invoke-direct {v13, v0, v3}, Lig1;-><init>(Ljava/lang/String;Z)V

    .line 145
    .line 146
    .line 147
    const/4 v7, 0x0

    .line 148
    const v8, 0x7fffffff

    .line 149
    .line 150
    .line 151
    const-wide/16 v9, 0x3c

    .line 152
    .line 153
    invoke-direct/range {v6 .. v13}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 154
    .line 155
    .line 156
    iput-object v6, p0, Ler0;->k:Ljava/lang/Object;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 157
    .line 158
    move-object v0, v6

    .line 159
    goto :goto_2

    .line 160
    :catchall_1
    move-exception v0

    .line 161
    goto :goto_5

    .line 162
    :cond_2
    :goto_2
    monitor-exit p0

    .line 163
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 164
    .line 165
    .line 166
    iget-object v6, v5, Ltx0;->l:Lwx0;

    .line 167
    .line 168
    iget-object v7, v6, Lwx0;->j:Lmr0;

    .line 169
    .line 170
    iget-object v7, v7, Lmr0;->j:Ler0;

    .line 171
    .line 172
    sget-object v7, Ljg1;->a:[B

    .line 173
    .line 174
    :try_start_4
    invoke-interface {v0, v5}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_4
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 175
    .line 176
    .line 177
    goto :goto_3

    .line 178
    :catchall_2
    move-exception v0

    .line 179
    move-object p0, v0

    .line 180
    goto :goto_4

    .line 181
    :catch_0
    move-exception v0

    .line 182
    :try_start_5
    new-instance v7, Ljava/io/InterruptedIOException;

    .line 183
    .line 184
    const-string v8, "executor rejected"

    .line 185
    .line 186
    invoke-direct {v7, v8}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    invoke-virtual {v7, v0}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 190
    .line 191
    .line 192
    invoke-virtual {v6, v7}, Lwx0;->h(Ljava/io/IOException;)Ljava/io/IOException;

    .line 193
    .line 194
    .line 195
    iget-object v0, v5, Ltx0;->j:Lxe0;

    .line 196
    .line 197
    invoke-virtual {v0, v6, v7}, Lxe0;->b(Lhi;Ljava/io/IOException;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 198
    .line 199
    .line 200
    iget-object v0, v6, Lwx0;->j:Lmr0;

    .line 201
    .line 202
    iget-object v0, v0, Lmr0;->j:Ler0;

    .line 203
    .line 204
    invoke-virtual {v0, v5}, Ler0;->h(Ltx0;)V

    .line 205
    .line 206
    .line 207
    :goto_3
    add-int/lit8 v4, v4, 0x1

    .line 208
    .line 209
    goto :goto_1

    .line 210
    :goto_4
    iget-object v0, v6, Lwx0;->j:Lmr0;

    .line 211
    .line 212
    iget-object v0, v0, Lmr0;->j:Ler0;

    .line 213
    .line 214
    invoke-virtual {v0, v5}, Ler0;->h(Ltx0;)V

    .line 215
    .line 216
    .line 217
    throw p0

    .line 218
    :goto_5
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 219
    throw v0

    .line 220
    :cond_3
    return-void

    .line 221
    :catchall_3
    move-exception v0

    .line 222
    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 223
    :try_start_8
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 224
    :goto_6
    monitor-exit p0

    .line 225
    throw v0
.end method

.method public s(Lkq;)Ljava/lang/Object;
    .locals 8

    .line 1
    instance-of v0, p1, Lc21;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lc21;

    .line 7
    .line 8
    iget v1, v0, Lc21;->q:I

    .line 9
    .line 10
    const/high16 v2, -0x80000000

    .line 11
    .line 12
    and-int v3, v1, v2

    .line 13
    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    sub-int/2addr v1, v2

    .line 17
    iput v1, v0, Lc21;->q:I

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    new-instance v0, Lc21;

    .line 21
    .line 22
    invoke-direct {v0, p0, p1}, Lc21;-><init>(Ler0;Lkq;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    iget-object p1, v0, Lc21;->o:Ljava/lang/Object;

    .line 26
    .line 27
    iget v1, v0, Lc21;->q:I

    .line 28
    .line 29
    const/4 v2, 0x2

    .line 30
    const/4 v3, 0x1

    .line 31
    sget-object v4, Lwe1;->a:Lwe1;

    .line 32
    .line 33
    const/4 v5, 0x0

    .line 34
    sget-object v6, Lar;->j:Lar;

    .line 35
    .line 36
    if-eqz v1, :cond_3

    .line 37
    .line 38
    if-eq v1, v3, :cond_2

    .line 39
    .line 40
    if-ne v1, v2, :cond_1

    .line 41
    .line 42
    iget-object p0, v0, Lc21;->n:Lzo0;

    .line 43
    .line 44
    iget-object v0, v0, Lc21;->m:Ler0;

    .line 45
    .line 46
    :try_start_0
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    .line 48
    .line 49
    goto :goto_3

    .line 50
    :catchall_0
    move-exception p1

    .line 51
    goto :goto_4

    .line 52
    :cond_1
    const-string p0, "call to \'resume\' before \'invoke\' with coroutine"

    .line 53
    .line 54
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-object v5

    .line 58
    :cond_2
    iget-object p0, v0, Lc21;->n:Lzo0;

    .line 59
    .line 60
    iget-object v1, v0, Lc21;->m:Ler0;

    .line 61
    .line 62
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    move-object p1, p0

    .line 66
    move-object p0, v1

    .line 67
    goto :goto_1

    .line 68
    :cond_3
    invoke-static {p1}, Lk42;->n(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    iget-object p1, p0, Ler0;->l:Ljava/lang/Object;

    .line 72
    .line 73
    check-cast p1, Lnl;

    .line 74
    .line 75
    invoke-virtual {p1}, Lng0;->A()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    instance-of p1, p1, Lee0;

    .line 80
    .line 81
    if-nez p1, :cond_4

    .line 82
    .line 83
    return-object v4

    .line 84
    :cond_4
    iget-object p1, p0, Ler0;->k:Ljava/lang/Object;

    .line 85
    .line 86
    check-cast p1, Lzo0;

    .line 87
    .line 88
    iput-object p0, v0, Lc21;->m:Ler0;

    .line 89
    .line 90
    iput-object p1, v0, Lc21;->n:Lzo0;

    .line 91
    .line 92
    iput v3, v0, Lc21;->q:I

    .line 93
    .line 94
    invoke-virtual {p1, v0}, Lzo0;->d(Lkq;)Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    if-ne v1, v6, :cond_5

    .line 99
    .line 100
    goto :goto_2

    .line 101
    :cond_5
    :goto_1
    :try_start_1
    iget-object v1, p0, Ler0;->l:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast v1, Lnl;

    .line 104
    .line 105
    invoke-virtual {v1}, Lng0;->A()Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v1

    .line 109
    instance-of v1, v1, Lee0;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 110
    .line 111
    if-nez v1, :cond_6

    .line 112
    .line 113
    invoke-virtual {p1, v5}, Lzo0;->f(Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    return-object v4

    .line 117
    :cond_6
    :try_start_2
    iput-object p0, v0, Lc21;->m:Ler0;

    .line 118
    .line 119
    iput-object p1, v0, Lc21;->n:Lzo0;

    .line 120
    .line 121
    iput v2, v0, Lc21;->q:I

    .line 122
    .line 123
    invoke-virtual {p0, v0}, Ler0;->d(Lkq;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 127
    if-ne v0, v6, :cond_7

    .line 128
    .line 129
    :goto_2
    return-object v6

    .line 130
    :cond_7
    move-object v0, p0

    .line 131
    move-object p0, p1

    .line 132
    :goto_3
    :try_start_3
    iget-object p1, v0, Ler0;->l:Ljava/lang/Object;

    .line 133
    .line 134
    check-cast p1, Lnl;

    .line 135
    .line 136
    invoke-virtual {p1, v4}, Lng0;->H(Ljava/lang/Object;)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 137
    .line 138
    .line 139
    invoke-virtual {p0, v5}, Lzo0;->f(Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    return-object v4

    .line 143
    :catchall_1
    move-exception p0

    .line 144
    move-object v7, p1

    .line 145
    move-object p1, p0

    .line 146
    move-object p0, v7

    .line 147
    :goto_4
    invoke-virtual {p0, v5}, Lzo0;->f(Ljava/lang/Object;)V

    .line 148
    .line 149
    .line 150
    throw p1
.end method

.method public t()Landroid/os/Bundle;
    .locals 13

    .line 1
    iget-object v0, p0, Ler0;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvz1;

    .line 4
    .line 5
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ly02;

    .line 8
    .line 9
    iget-object v2, p0, Ler0;->l:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v2, Landroid/os/Bundle;

    .line 12
    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    goto/16 :goto_6

    .line 16
    .line 17
    :cond_0
    iget-object v2, p0, Ler0;->k:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast v2, Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v0}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_b

    .line 31
    .line 32
    :try_start_0
    new-instance v2, Landroid/os/Bundle;

    .line 33
    .line 34
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 35
    .line 36
    .line 37
    new-instance v4, Lorg/json/JSONArray;

    .line 38
    .line 39
    invoke-direct {v4, v0}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    move v5, v0

    .line 44
    :goto_0
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    .line 45
    .line 46
    .line 47
    move-result v6
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_1

    .line 48
    if-ge v5, v6, :cond_a

    .line 49
    .line 50
    :try_start_1
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    const-string v7, "n"

    .line 55
    .line 56
    invoke-virtual {v6, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    const-string v8, "t"

    .line 61
    .line 62
    invoke-virtual {v6, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v8

    .line 66
    invoke-virtual {v8}, Ljava/lang/String;->hashCode()I

    .line 67
    .line 68
    .line 69
    move-result v9
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0

    .line 70
    const/16 v10, 0x64

    .line 71
    .line 72
    const-string v11, "v"

    .line 73
    .line 74
    if-eq v9, v10, :cond_7

    .line 75
    .line 76
    const/16 v10, 0x6c

    .line 77
    .line 78
    if-eq v9, v10, :cond_6

    .line 79
    .line 80
    const/16 v10, 0x73

    .line 81
    .line 82
    if-eq v9, v10, :cond_5

    .line 83
    .line 84
    const/16 v10, 0xd18

    .line 85
    .line 86
    if-eq v9, v10, :cond_3

    .line 87
    .line 88
    const/16 v10, 0xd75

    .line 89
    .line 90
    if-eq v9, v10, :cond_1

    .line 91
    .line 92
    goto/16 :goto_3

    .line 93
    .line 94
    :cond_1
    const-string v9, "la"

    .line 95
    .line 96
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v9

    .line 100
    if-eqz v9, :cond_8

    .line 101
    .line 102
    :try_start_2
    invoke-static {}, Lqs1;->a()V

    .line 103
    .line 104
    .line 105
    iget-object v8, v1, Ly02;->m:Lmt1;

    .line 106
    .line 107
    sget-object v9, Lxx1;->P0:Lwx1;

    .line 108
    .line 109
    invoke-virtual {v8, v3, v9}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 110
    .line 111
    .line 112
    move-result v8

    .line 113
    if-eqz v8, :cond_9

    .line 114
    .line 115
    new-instance v8, Lorg/json/JSONArray;

    .line 116
    .line 117
    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    invoke-direct {v8, v6}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    .line 125
    .line 126
    .line 127
    move-result v6

    .line 128
    new-array v9, v6, [J

    .line 129
    .line 130
    move v10, v0

    .line 131
    :goto_1
    if-ge v10, v6, :cond_2

    .line 132
    .line 133
    invoke-virtual {v8, v10}, Lorg/json/JSONArray;->optLong(I)J

    .line 134
    .line 135
    .line 136
    move-result-wide v11

    .line 137
    aput-wide v11, v9, v10

    .line 138
    .line 139
    add-int/lit8 v10, v10, 0x1

    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_2
    invoke-virtual {v2, v7, v9}, Landroid/os/BaseBundle;->putLongArray(Ljava/lang/String;[J)V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_2 .. :try_end_2} :catch_0

    .line 143
    .line 144
    .line 145
    goto/16 :goto_4

    .line 146
    .line 147
    :cond_3
    const-string v9, "ia"

    .line 148
    .line 149
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result v9

    .line 153
    if-eqz v9, :cond_8

    .line 154
    .line 155
    :try_start_3
    invoke-static {}, Lqs1;->a()V

    .line 156
    .line 157
    .line 158
    iget-object v8, v1, Ly02;->m:Lmt1;

    .line 159
    .line 160
    sget-object v9, Lxx1;->P0:Lwx1;

    .line 161
    .line 162
    invoke-virtual {v8, v3, v9}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 163
    .line 164
    .line 165
    move-result v8

    .line 166
    if-eqz v8, :cond_9

    .line 167
    .line 168
    new-instance v8, Lorg/json/JSONArray;

    .line 169
    .line 170
    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    invoke-direct {v8, v6}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    .line 178
    .line 179
    .line 180
    move-result v6

    .line 181
    new-array v9, v6, [I

    .line 182
    .line 183
    move v10, v0

    .line 184
    :goto_2
    if-ge v10, v6, :cond_4

    .line 185
    .line 186
    invoke-virtual {v8, v10}, Lorg/json/JSONArray;->optInt(I)I

    .line 187
    .line 188
    .line 189
    move-result v11

    .line 190
    aput v11, v9, v10

    .line 191
    .line 192
    add-int/lit8 v10, v10, 0x1

    .line 193
    .line 194
    goto :goto_2

    .line 195
    :cond_4
    invoke-virtual {v2, v7, v9}, Landroid/os/BaseBundle;->putIntArray(Ljava/lang/String;[I)V
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0

    .line 196
    .line 197
    .line 198
    goto :goto_4

    .line 199
    :cond_5
    const-string v9, "s"

    .line 200
    .line 201
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v9

    .line 205
    if-eqz v9, :cond_8

    .line 206
    .line 207
    :try_start_4
    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v6

    .line 211
    invoke-virtual {v2, v7, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_4 .. :try_end_4} :catch_0

    .line 212
    .line 213
    .line 214
    goto :goto_4

    .line 215
    :cond_6
    const-string v9, "l"

    .line 216
    .line 217
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 218
    .line 219
    .line 220
    move-result v9

    .line 221
    if-eqz v9, :cond_8

    .line 222
    .line 223
    :try_start_5
    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v6

    .line 227
    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 228
    .line 229
    .line 230
    move-result-wide v8

    .line 231
    invoke-virtual {v2, v7, v8, v9}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_0

    .line 232
    .line 233
    .line 234
    goto :goto_4

    .line 235
    :cond_7
    const-string v9, "d"

    .line 236
    .line 237
    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v9

    .line 241
    if-eqz v9, :cond_8

    .line 242
    .line 243
    :try_start_6
    invoke-virtual {v6, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v6

    .line 247
    invoke-static {v6}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    .line 248
    .line 249
    .line 250
    move-result-wide v8

    .line 251
    invoke-virtual {v2, v7, v8, v9}, Landroid/os/BaseBundle;->putDouble(Ljava/lang/String;D)V

    .line 252
    .line 253
    .line 254
    goto :goto_4

    .line 255
    :cond_8
    :goto_3
    iget-object v6, v1, Ly02;->o:Lzy1;

    .line 256
    .line 257
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 258
    .line 259
    .line 260
    iget-object v6, v6, Lzy1;->o:Lso;

    .line 261
    .line 262
    const-string v7, "Unrecognized persisted bundle type. Type"

    .line 263
    .line 264
    invoke-virtual {v6, v8, v7}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_0
    .catch Ljava/lang/NumberFormatException; {:try_start_6 .. :try_end_6} :catch_0

    .line 265
    .line 266
    .line 267
    goto :goto_4

    .line 268
    :catch_0
    :try_start_7
    iget-object v6, v1, Ly02;->o:Lzy1;

    .line 269
    .line 270
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 271
    .line 272
    .line 273
    iget-object v6, v6, Lzy1;->o:Lso;

    .line 274
    .line 275
    const-string v7, "Error reading value from SharedPreferences. Value dropped"

    .line 276
    .line 277
    invoke-virtual {v6, v7}, Lso;->b(Ljava/lang/String;)V

    .line 278
    .line 279
    .line 280
    :cond_9
    :goto_4
    add-int/lit8 v5, v5, 0x1

    .line 281
    .line 282
    goto/16 :goto_0

    .line 283
    .line 284
    :cond_a
    iput-object v2, p0, Ler0;->l:Ljava/lang/Object;
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_1

    .line 285
    .line 286
    goto :goto_5

    .line 287
    :catch_1
    iget-object v0, v1, Ly02;->o:Lzy1;

    .line 288
    .line 289
    invoke-static {v0}, Ly02;->l(Lm22;)V

    .line 290
    .line 291
    .line 292
    iget-object v0, v0, Lzy1;->o:Lso;

    .line 293
    .line 294
    const-string v1, "Error loading bundle from SharedPreferences. Values will be lost"

    .line 295
    .line 296
    invoke-virtual {v0, v1}, Lso;->b(Ljava/lang/String;)V

    .line 297
    .line 298
    .line 299
    :cond_b
    :goto_5
    iget-object v0, p0, Ler0;->l:Ljava/lang/Object;

    .line 300
    .line 301
    check-cast v0, Landroid/os/Bundle;

    .line 302
    .line 303
    if-nez v0, :cond_c

    .line 304
    .line 305
    iget-object v0, p0, Ler0;->n:Ljava/lang/Object;

    .line 306
    .line 307
    check-cast v0, Landroid/os/Bundle;

    .line 308
    .line 309
    iput-object v0, p0, Ler0;->l:Ljava/lang/Object;

    .line 310
    .line 311
    :cond_c
    :goto_6
    new-instance v0, Landroid/os/Bundle;

    .line 312
    .line 313
    iget-object p0, p0, Ler0;->l:Ljava/lang/Object;

    .line 314
    .line 315
    check-cast p0, Landroid/os/Bundle;

    .line 316
    .line 317
    invoke-static {p0}, Lbh;->h(Ljava/lang/Object;)V

    .line 318
    .line 319
    .line 320
    invoke-direct {v0, p0}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 321
    .line 322
    .line 323
    return-object v0
.end method

.method public varargs u(Ler0;[Ll22;)Lst1;
    .locals 4

    .line 1
    sget-object v0, Lst1;->b:Lzt1;

    .line 2
    .line 3
    array-length v1, p2

    .line 4
    const/4 v2, 0x0

    .line 5
    :goto_0
    if-ge v2, v1, :cond_2

    .line 6
    .line 7
    aget-object v0, p2, v2

    .line 8
    .line 9
    invoke-static {v0}, Lxg;->u(Ll22;)Lst1;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v3, p0, Ler0;->m:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v3, Ler0;

    .line 16
    .line 17
    invoke-static {v3}, Lbe2;->W(Ler0;)V

    .line 18
    .line 19
    .line 20
    instance-of v3, v0, Ltt1;

    .line 21
    .line 22
    if-nez v3, :cond_0

    .line 23
    .line 24
    instance-of v3, v0, Lqt1;

    .line 25
    .line 26
    if-eqz v3, :cond_1

    .line 27
    .line 28
    :cond_0
    iget-object v3, p0, Ler0;->k:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v3, Lxn0;

    .line 31
    .line 32
    invoke-virtual {v3, p1, v0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    return-object v0
.end method

.method public v(Lst1;)Lst1;
    .locals 1

    .line 1
    iget-object v0, p0, Ler0;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lxn0;

    .line 4
    .line 5
    invoke-virtual {v0, p0, p1}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public w(Lrp1;)Lst1;
    .locals 3

    .line 1
    sget-object v0, Lst1;->b:Lzt1;

    .line 2
    .line 3
    invoke-virtual {p1}, Lrp1;->r()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    :cond_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Integer;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v2, p0, Ler0;->l:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast v2, Lxn0;

    .line 26
    .line 27
    invoke-virtual {p1, v0}, Lrp1;->t(I)Lst1;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v2, p0, v0}, Lxn0;->A(Ler0;Lst1;)Lst1;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    instance-of v2, v0, Lbr1;

    .line 36
    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    :cond_1
    return-object v0
.end method

.method public x(Landroid/os/Bundle;)V
    .locals 14

    .line 1
    iget-object v0, p0, Ler0;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lvz1;

    .line 4
    .line 5
    iget-object v1, v0, Let;->j:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ly02;

    .line 8
    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    new-instance p1, Landroid/os/Bundle;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    new-instance v2, Landroid/os/Bundle;

    .line 18
    .line 19
    invoke-direct {v2, p1}, Landroid/os/Bundle;-><init>(Landroid/os/Bundle;)V

    .line 20
    .line 21
    .line 22
    move-object p1, v2

    .line 23
    :goto_0
    invoke-virtual {v0}, Lvz1;->p()Landroid/content/SharedPreferences;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p1}, Landroid/os/BaseBundle;->size()I

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    iget-object v3, p0, Ler0;->k:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast v3, Ljava/lang/String;

    .line 38
    .line 39
    if-nez v2, :cond_1

    .line 40
    .line 41
    invoke-interface {v0, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 42
    .line 43
    .line 44
    goto/16 :goto_4

    .line 45
    .line 46
    :cond_1
    new-instance v2, Lorg/json/JSONArray;

    .line 47
    .line 48
    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-interface {v4}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    :cond_2
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 60
    .line 61
    .line 62
    move-result v5

    .line 63
    if-eqz v5, :cond_c

    .line 64
    .line 65
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    check-cast v5, Ljava/lang/String;

    .line 70
    .line 71
    invoke-virtual {p1, v5}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    if-eqz v6, :cond_2

    .line 76
    .line 77
    :try_start_0
    new-instance v7, Lorg/json/JSONObject;

    .line 78
    .line 79
    invoke-direct {v7}, Lorg/json/JSONObject;-><init>()V

    .line 80
    .line 81
    .line 82
    const-string v8, "n"

    .line 83
    .line 84
    invoke-virtual {v7, v8, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 85
    .line 86
    .line 87
    invoke-static {}, Lqs1;->a()V

    .line 88
    .line 89
    .line 90
    iget-object v5, v1, Ly02;->m:Lmt1;

    .line 91
    .line 92
    sget-object v8, Lxx1;->P0:Lwx1;

    .line 93
    .line 94
    const/4 v9, 0x0

    .line 95
    invoke-virtual {v5, v9, v8}, Lmt1;->w(Ljava/lang/String;Lwx1;)Z

    .line 96
    .line 97
    .line 98
    move-result v5
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    const-string v8, "Cannot serialize bundle value to SharedPreferences. Type"

    .line 100
    .line 101
    const-string v9, "d"

    .line 102
    .line 103
    const-string v10, "l"

    .line 104
    .line 105
    const-string v11, "s"

    .line 106
    .line 107
    const-string v12, "v"

    .line 108
    .line 109
    const-string v13, "t"

    .line 110
    .line 111
    if-eqz v5, :cond_8

    .line 112
    .line 113
    :try_start_1
    instance-of v5, v6, Ljava/lang/String;

    .line 114
    .line 115
    if-eqz v5, :cond_3

    .line 116
    .line 117
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v5

    .line 121
    invoke-virtual {v7, v12, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v7, v13, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 125
    .line 126
    .line 127
    goto/16 :goto_2

    .line 128
    .line 129
    :catch_0
    move-exception v5

    .line 130
    goto/16 :goto_3

    .line 131
    .line 132
    :cond_3
    instance-of v5, v6, Ljava/lang/Long;

    .line 133
    .line 134
    if-eqz v5, :cond_4

    .line 135
    .line 136
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v5

    .line 140
    invoke-virtual {v7, v12, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 141
    .line 142
    .line 143
    invoke-virtual {v7, v13, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 144
    .line 145
    .line 146
    goto :goto_2

    .line 147
    :cond_4
    instance-of v5, v6, [I

    .line 148
    .line 149
    if-eqz v5, :cond_5

    .line 150
    .line 151
    check-cast v6, [I

    .line 152
    .line 153
    invoke-static {v6}, Ljava/util/Arrays;->toString([I)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v5

    .line 157
    invoke-virtual {v7, v12, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 158
    .line 159
    .line 160
    const-string v5, "ia"

    .line 161
    .line 162
    invoke-virtual {v7, v13, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 163
    .line 164
    .line 165
    goto :goto_2

    .line 166
    :cond_5
    instance-of v5, v6, [J

    .line 167
    .line 168
    if-eqz v5, :cond_6

    .line 169
    .line 170
    check-cast v6, [J

    .line 171
    .line 172
    invoke-static {v6}, Ljava/util/Arrays;->toString([J)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v5

    .line 176
    invoke-virtual {v7, v12, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 177
    .line 178
    .line 179
    const-string v5, "la"

    .line 180
    .line 181
    invoke-virtual {v7, v13, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 182
    .line 183
    .line 184
    goto :goto_2

    .line 185
    :cond_6
    instance-of v5, v6, Ljava/lang/Double;

    .line 186
    .line 187
    if-eqz v5, :cond_7

    .line 188
    .line 189
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    invoke-virtual {v7, v12, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 194
    .line 195
    .line 196
    invoke-virtual {v7, v13, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 197
    .line 198
    .line 199
    goto :goto_2

    .line 200
    :cond_7
    iget-object v5, v1, Ly02;->o:Lzy1;

    .line 201
    .line 202
    invoke-static {v5}, Ly02;->l(Lm22;)V

    .line 203
    .line 204
    .line 205
    iget-object v5, v5, Lzy1;->o:Lso;

    .line 206
    .line 207
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 208
    .line 209
    .line 210
    move-result-object v6

    .line 211
    invoke-virtual {v5, v6, v8}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    goto/16 :goto_1

    .line 215
    .line 216
    :cond_8
    invoke-virtual {v6}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v5

    .line 220
    invoke-virtual {v7, v12, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 221
    .line 222
    .line 223
    instance-of v5, v6, Ljava/lang/String;

    .line 224
    .line 225
    if-eqz v5, :cond_9

    .line 226
    .line 227
    invoke-virtual {v7, v13, v11}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 228
    .line 229
    .line 230
    goto :goto_2

    .line 231
    :cond_9
    instance-of v5, v6, Ljava/lang/Long;

    .line 232
    .line 233
    if-eqz v5, :cond_a

    .line 234
    .line 235
    invoke-virtual {v7, v13, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 236
    .line 237
    .line 238
    goto :goto_2

    .line 239
    :cond_a
    instance-of v5, v6, Ljava/lang/Double;

    .line 240
    .line 241
    if-eqz v5, :cond_b

    .line 242
    .line 243
    invoke-virtual {v7, v13, v9}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 244
    .line 245
    .line 246
    :goto_2
    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 247
    .line 248
    .line 249
    goto/16 :goto_1

    .line 250
    .line 251
    :cond_b
    iget-object v5, v1, Ly02;->o:Lzy1;

    .line 252
    .line 253
    invoke-static {v5}, Ly02;->l(Lm22;)V

    .line 254
    .line 255
    .line 256
    iget-object v5, v5, Lzy1;->o:Lso;

    .line 257
    .line 258
    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 259
    .line 260
    .line 261
    move-result-object v6

    .line 262
    invoke-virtual {v5, v6, v8}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 263
    .line 264
    .line 265
    goto/16 :goto_1

    .line 266
    .line 267
    :goto_3
    iget-object v6, v1, Ly02;->o:Lzy1;

    .line 268
    .line 269
    invoke-static {v6}, Ly02;->l(Lm22;)V

    .line 270
    .line 271
    .line 272
    iget-object v6, v6, Lzy1;->o:Lso;

    .line 273
    .line 274
    const-string v7, "Cannot serialize bundle value to SharedPreferences"

    .line 275
    .line 276
    invoke-virtual {v6, v5, v7}, Lso;->c(Ljava/lang/Object;Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    goto/16 :goto_1

    .line 280
    .line 281
    :cond_c
    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    invoke-interface {v0, v3, v1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 286
    .line 287
    .line 288
    :goto_4
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 289
    .line 290
    .line 291
    iput-object p1, p0, Ler0;->l:Ljava/lang/Object;

    .line 292
    .line 293
    return-void
.end method

.method public y()Ler0;
    .locals 2

    .line 1
    new-instance v0, Ler0;

    .line 2
    .line 3
    iget-object v1, p0, Ler0;->l:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast v1, Lxn0;

    .line 6
    .line 7
    invoke-direct {v0, p0, v1}, Ler0;-><init>(Ler0;Lxn0;)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public z(Ljava/lang/String;)Z
    .locals 1

    .line 1
    iget-object v0, p0, Ler0;->m:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    iget-object p0, p0, Ler0;->k:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast p0, Ler0;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ler0;->z(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_1
    const/4 p0, 0x0

    .line 25
    return p0
.end method
