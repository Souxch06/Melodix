.class public Lbv1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lhn0;
.implements Lq8;
.implements Lum0;
.implements Lyp;
.implements Lpa1;
.implements Ln4;
.implements Lkw0;
.implements Li3;
.implements Ljw0;


# static fields
.field public static volatile l:Lbv1;

.field public static final m:Lca0;

.field public static final n:Lt11;

.field public static final o:Lfe2;


# instance fields
.field public final synthetic j:I

.field public final k:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lca0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Lca0;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lbv1;->m:Lca0;

    .line 8
    .line 9
    new-instance v0, Lt11;

    .line 10
    .line 11
    const/16 v1, 0x18

    .line 12
    .line 13
    invoke-direct {v0, v1}, Lt11;-><init>(I)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lbv1;->n:Lt11;

    .line 17
    .line 18
    new-instance v0, Lfe2;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    sput-object v0, Lbv1;->o:Lfe2;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(I)V
    .locals 6

    .line 1
    iput p1, p0, Lbv1;->j:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/4 v1, 0x2

    .line 5
    const/4 v2, 0x0

    .line 6
    sparse-switch p1, :sswitch_data_0

    .line 7
    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance p1, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lbv1;->k:Ljava/lang/Object;

    .line 18
    .line 19
    return-void

    .line 20
    :sswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance p1, Ll80;

    .line 24
    .line 25
    invoke-direct {p1}, Ll80;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lbv1;->k:Ljava/lang/Object;

    .line 29
    .line 30
    return-void

    .line 31
    :sswitch_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    .line 33
    .line 34
    new-instance p1, Lt91;

    .line 35
    .line 36
    sget-object v0, Lqe1;->b:Lqe1;

    .line 37
    .line 38
    invoke-direct {p1, v0}, Lt91;-><init>(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    iput-object p1, p0, Lbv1;->k:Ljava/lang/Object;

    .line 42
    .line 43
    return-void

    .line 44
    :sswitch_2
    sget-object p1, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    .line 48
    .line 49
    new-instance p1, Lxe0;

    .line 50
    .line 51
    sget-object v0, Lqb1;->h:Lqb1;

    .line 52
    .line 53
    invoke-direct {p1, v0}, Lxe0;-><init>(Lqb1;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lbv1;->k:Ljava/lang/Object;

    .line 60
    .line 61
    return-void

    .line 62
    :sswitch_3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    .line 64
    .line 65
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 66
    .line 67
    invoke-direct {p1, v2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 68
    .line 69
    .line 70
    iput-object p1, p0, Lbv1;->k:Ljava/lang/Object;

    .line 71
    .line 72
    return-void

    .line 73
    :sswitch_4
    new-instance p1, Lny0;

    .line 74
    .line 75
    sget v3, Lso1;->a:I

    .line 76
    .line 77
    new-array v1, v1, [Llq1;

    .line 78
    .line 79
    sget-object v3, Lmz;->r:Lmz;

    .line 80
    .line 81
    aput-object v3, v1, v2

    .line 82
    .line 83
    sget-object v2, Lbv1;->n:Lt11;

    .line 84
    .line 85
    aput-object v2, v1, v0

    .line 86
    .line 87
    const/16 v0, 0x11

    .line 88
    .line 89
    invoke-direct {p1, v0, v1}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 93
    .line 94
    .line 95
    iput-object p1, p0, Lbv1;->k:Ljava/lang/Object;

    .line 96
    .line 97
    return-void

    .line 98
    :sswitch_5
    new-instance p1, Lel0;

    .line 99
    .line 100
    :try_start_0
    const-string v3, "com.google.protobuf.DescriptorMessageInfoFactory"

    .line 101
    .line 102
    invoke-static {v3}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 103
    .line 104
    .line 105
    move-result-object v3

    .line 106
    const-string v4, "getInstance"

    .line 107
    .line 108
    const/4 v5, 0x0

    .line 109
    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    invoke-virtual {v3, v5, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Lnn0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :catch_0
    sget-object v3, Lbv1;->m:Lca0;

    .line 121
    .line 122
    :goto_0
    new-array v1, v1, [Lnn0;

    .line 123
    .line 124
    sget-object v4, Lca0;->b:Lca0;

    .line 125
    .line 126
    aput-object v4, v1, v2

    .line 127
    .line 128
    aput-object v3, v1, v0

    .line 129
    .line 130
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 131
    .line 132
    .line 133
    iput-object v1, p1, Lel0;->a:[Lnn0;

    .line 134
    .line 135
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    .line 137
    .line 138
    sget-object v0, Lkf0;->a:Ljava/nio/charset/Charset;

    .line 139
    .line 140
    iput-object p1, p0, Lbv1;->k:Ljava/lang/Object;

    .line 141
    .line 142
    return-void

    .line 143
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_5
        0x2 -> :sswitch_4
        0x6 -> :sswitch_3
        0xb -> :sswitch_2
        0xf -> :sswitch_1
        0x17 -> :sswitch_0
    .end sparse-switch
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 143
    iput p1, p0, Lbv1;->j:I

    iput-object p2, p0, Lbv1;->k:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/net/Uri;Landroid/content/ClipDescription;Landroid/net/Uri;)V
    .locals 2

    const/16 v0, 0x18

    iput v0, p0, Lbv1;->j:I

    .line 154
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 155
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x19

    if-lt v0, v1, :cond_0

    .line 156
    new-instance v0, Lke0;

    invoke-direct {v0, p1, p2, p3}, Lke0;-><init>(Landroid/net/Uri;Landroid/content/ClipDescription;Landroid/net/Uri;)V

    iput-object v0, p0, Lbv1;->k:Ljava/lang/Object;

    goto :goto_0

    .line 157
    :cond_0
    new-instance v0, Lc9;

    const/16 v1, 0xd

    invoke-direct {v0, p1, p2, p3, v1}, Lc9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V

    iput-object v0, p0, Lbv1;->k:Ljava/lang/Object;

    :goto_0
    return-void
.end method

.method public constructor <init>(Landroid/view/ContentInfo;)V
    .locals 1

    const/16 v0, 0xc

    iput v0, p0, Lbv1;->j:I

    .line 159
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 160
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 161
    invoke-static {p1}, Lvp;->f(Ljava/lang/Object;)Landroid/view/ContentInfo;

    move-result-object p1

    iput-object p1, p0, Lbv1;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/widget/EditText;)V
    .locals 2

    const/16 v0, 0x12

    iput v0, p0, Lbv1;->j:I

    .line 152
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 153
    new-instance v0, Ls7;

    const/16 v1, 0x13

    invoke-direct {v0, p1, v1}, Ls7;-><init>(Landroid/widget/EditText;I)V

    iput-object v0, p0, Lbv1;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/widget/TextView;)V
    .locals 1

    const/16 v0, 0x13

    iput v0, p0, Lbv1;->j:I

    .line 150
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 151
    new-instance v0, Lm00;

    invoke-direct {v0, p1}, Lm00;-><init>(Landroid/widget/TextView;)V

    iput-object v0, p0, Lbv1;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/bottomsheet/BottomSheetBehavior;)V
    .locals 1

    const/4 v0, 0x7

    iput v0, p0, Lbv1;->j:I

    .line 162
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbv1;->k:Ljava/lang/Object;

    .line 163
    new-instance p1, Lwg;

    invoke-direct {p1, p0}, Lwg;-><init>(Lbv1;)V

    return-void
.end method

.method public constructor <init>(Lm30;)V
    .locals 2

    const/16 v0, 0x8

    iput v0, p0, Lbv1;->j:I

    .line 147
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 148
    new-instance v0, Ljava/io/File;

    iget-object p1, p1, Lm30;->l:Ljava/lang/Object;

    check-cast p1, Ljava/io/File;

    const-string v1, "com.crashlytics.settings.json"

    invoke-direct {v0, p1, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 149
    iput-object v0, p0, Lbv1;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lmr;Ljava/lang/String;)V
    .locals 0

    const/16 p2, 0xd

    iput p2, p0, Lbv1;->j:I

    .line 158
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lbv1;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lzk;)V
    .locals 1

    const/16 v0, 0xa

    iput v0, p0, Lbv1;->j:I

    .line 144
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    sget-object v0, Llf0;->a:Ljava/nio/charset/Charset;

    iput-object p1, p0, Lbv1;->k:Ljava/lang/Object;

    .line 146
    iput-object p0, p1, Lzk;->a:Lbv1;

    return-void
.end method

.method public static m(Ljava/lang/Object;)Lbv1;
    .locals 2

    .line 1
    new-instance v0, Lbv1;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/16 v1, 0x19

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Lbv1;-><init>(ILjava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    const-string p0, "instance cannot be null"

    .line 12
    .line 13
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method public static t(Ljava/lang/String;Lee2;)V
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/util/Date;

    .line 7
    .line 8
    iget-wide v2, p1, Lee2;->b:J

    .line 9
    .line 10
    const-wide/32 v4, 0xf4240

    .line 11
    .line 12
    .line 13
    div-long/2addr v2, v4

    .line 14
    invoke-direct {v1, v2, v3}, Ljava/util/Date;-><init>(J)V

    .line 15
    .line 16
    .line 17
    new-instance v2, Ljava/text/SimpleDateFormat;

    .line 18
    .line 19
    const-string v3, "yyyy-MM-dd\'T\'HH:mm:ss.SSSZ"

    .line 20
    .line 21
    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v2, v1}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    const-string v1, ": logging error ["

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    iget-object p1, p1, Lee2;->d:Lne2;

    .line 37
    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    invoke-static {v1, p1, v0}, Lju1;->A(ILne2;Ljava/lang/StringBuilder;)Z

    .line 42
    .line 43
    .line 44
    const-string p1, "]: "

    .line 45
    .line 46
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    sget-object p0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 53
    .line 54
    invoke-virtual {p0, v0}, Ljava/io/PrintStream;->println(Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    sget-object p0, Ljava/lang/System;->err:Ljava/io/PrintStream;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/io/PrintStream;->flush()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_0
    const-string p0, "cannot request log site information prior to postProcess()"

    .line 64
    .line 65
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method


# virtual methods
.method public a()Landroid/content/ClipData;
    .locals 0

    .line 1
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroid/view/ContentInfo;

    .line 4
    .line 5
    invoke-static {p0}, Lvp;->b(Landroid/view/ContentInfo;)Landroid/content/ClipData;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public b(Lrm0;Z)V
    .locals 2

    .line 1
    instance-of v0, p1, Lna1;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Lna1;

    .line 7
    .line 8
    iget-object v0, v0, Lna1;->z:Lrm0;

    .line 9
    .line 10
    invoke-virtual {v0}, Lrm0;->k()Lrm0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Lrm0;->c(Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Lu2;

    .line 21
    .line 22
    iget-object p0, p0, Lu2;->n:Lhn0;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-interface {p0, p1, p2}, Lhn0;->b(Lrm0;Z)V

    .line 27
    .line 28
    .line 29
    :cond_1
    return-void
.end method

.method public c(Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Lh3;

    .line 2
    .line 3
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Lz70;

    .line 6
    .line 7
    iget-object v0, p0, Lz70;->C:Ljava/util/ArrayDeque;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->pollFirst()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Lw70;

    .line 14
    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    iget-object v1, v0, Lw70;->j:Ljava/lang/String;

    .line 19
    .line 20
    iget v0, v0, Lw70;->k:I

    .line 21
    .line 22
    iget-object p0, p0, Lz70;->c:Ler0;

    .line 23
    .line 24
    invoke-virtual {p0, v1}, Ler0;->f(Ljava/lang/String;)Lh70;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-nez p0, :cond_1

    .line 29
    .line 30
    :goto_0
    return-void

    .line 31
    :cond_1
    iget v1, p1, Lh3;->j:I

    .line 32
    .line 33
    iget-object p1, p1, Lh3;->k:Landroid/content/Intent;

    .line 34
    .line 35
    invoke-virtual {p0, v0, v1, p1}, Lh70;->t(IILandroid/content/Intent;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public d(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public e(Lrm0;Landroid/view/MenuItem;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lej;

    .line 4
    .line 5
    iget-object p0, p0, Lej;->o:Landroid/os/Handler;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f()Landroid/view/ContentInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroid/view/ContentInfo;

    .line 4
    .line 5
    return-object p0
.end method

.method public g(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public get()Ljava/lang/Object;
    .locals 1

    .line 1
    iget v0, p0, Lbv1;->j:I

    .line 2
    .line 3
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 4
    .line 5
    sparse-switch v0, :sswitch_data_0

    .line 6
    .line 7
    .line 8
    check-cast p0, Lbv1;

    .line 9
    .line 10
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 11
    .line 12
    check-cast p0, Landroid/content/Context;

    .line 13
    .line 14
    new-instance v0, Lyj0;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Lyj0;-><init>(Landroid/content/Context;)V

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :sswitch_0
    return-object p0

    .line 21
    :sswitch_1
    check-cast p0, Lkw0;

    .line 22
    .line 23
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Landroid/content/Context;

    .line 28
    .line 29
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    if-eqz p0, :cond_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_0
    const-string p0, "Cannot return null from a non-@Nullable @Provides method"

    .line 37
    .line 38
    invoke-static {p0}, Lwd1;->d(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    :goto_0
    return-object p0

    .line 43
    :sswitch_data_0
    .sparse-switch
        0x14 -> :sswitch_1
        0x19 -> :sswitch_0
    .end sparse-switch
.end method

.method public getFlags()I
    .locals 0

    .line 1
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroid/view/ContentInfo;

    .line 4
    .line 5
    invoke-static {p0}, Lvp;->a(Landroid/view/ContentInfo;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public h()I
    .locals 0

    .line 1
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroid/view/ContentInfo;

    .line 4
    .line 5
    invoke-static {p0}, Lvp;->k(Landroid/view/ContentInfo;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public i(Lrm0;Lvm0;)V
    .locals 7

    .line 1
    iget-object v0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lej;

    .line 4
    .line 5
    iget-object v1, v0, Lej;->o:Landroid/os/Handler;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, v0, Lej;->q:Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 14
    .line 15
    .line 16
    move-result v3

    .line 17
    const/4 v4, 0x0

    .line 18
    :goto_0
    const/4 v5, -0x1

    .line 19
    if-ge v4, v3, :cond_1

    .line 20
    .line 21
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    check-cast v6, Ldj;

    .line 26
    .line 27
    iget-object v6, v6, Ldj;->b:Lrm0;

    .line 28
    .line 29
    if-ne p1, v6, :cond_0

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    move v4, v5

    .line 36
    :goto_1
    if-ne v4, v5, :cond_2

    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    add-int/lit8 v4, v4, 0x1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-ge v4, v3, :cond_3

    .line 46
    .line 47
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    move-object v2, v0

    .line 52
    check-cast v2, Ldj;

    .line 53
    .line 54
    :cond_3
    new-instance v0, Lcj;

    .line 55
    .line 56
    invoke-direct {v0, p0, v2, p2, p1}, Lcj;-><init>(Lbv1;Ldj;Lvm0;Lrm0;)V

    .line 57
    .line 58
    .line 59
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 60
    .line 61
    .line 62
    move-result-wide v2

    .line 63
    const-wide/16 v4, 0xc8

    .line 64
    .line 65
    add-long/2addr v2, v4

    .line 66
    invoke-virtual {v1, v0, p1, v2, v3}, Landroid/os/Handler;->postAtTime(Ljava/lang/Runnable;Ljava/lang/Object;J)Z

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public j(IF)V
    .locals 0

    .line 1
    return-void
.end method

.method public k(Landroid/os/Bundle;)V
    .locals 2

    .line 1
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lj4;

    .line 4
    .line 5
    const-string v0, "clx"

    .line 6
    .line 7
    check-cast p0, Lk4;

    .line 8
    .line 9
    const-string v1, "_ae"

    .line 10
    .line 11
    invoke-virtual {p0, v0, v1, p1}, Lk4;->a(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public l(Lrm0;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lu2;

    .line 4
    .line 5
    iget-object v0, p0, Lu2;->l:Lrm0;

    .line 6
    .line 7
    if-ne p1, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    move-object v0, p1

    .line 11
    check-cast v0, Lna1;

    .line 12
    .line 13
    iget-object v0, v0, Lna1;->A:Lvm0;

    .line 14
    .line 15
    iget-object p0, p0, Lu2;->n:Lhn0;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    invoke-interface {p0, p1}, Lhn0;->l(Lrm0;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 25
    return p0
.end method

.method public n()Lr91;
    .locals 4

    .line 1
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lt91;

    .line 4
    .line 5
    sget-object v0, Lqe0;->d:Log0;

    .line 6
    .line 7
    sget-object v1, Lja;->a:Lsun/misc/Unsafe;

    .line 8
    .line 9
    sget-wide v2, Lt91;->n:J

    .line 10
    .line 11
    invoke-virtual {v1, p0, v2, v3}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    if-ne p0, v0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x0

    .line 18
    :cond_0
    check-cast p0, Lr91;

    .line 19
    .line 20
    return-object p0
.end method

.method public o(Ljava/lang/Object;)Ljd2;
    .locals 2

    .line 1
    check-cast p1, Lp51;

    .line 2
    .line 3
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Lmr;

    .line 6
    .line 7
    iget-object p0, p0, Lmr;->e:Lor;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-static {v0}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_0
    sget-object p1, Lor;->r:Ly1;

    .line 18
    .line 19
    invoke-virtual {p0}, Lor;->d()Ljd2;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object v1, p0, Lor;->m:Li7;

    .line 24
    .line 25
    iget-object p0, p0, Lor;->e:Lc9;

    .line 26
    .line 27
    iget-object p0, p0, Lc9;->k:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast p0, Lzs;

    .line 30
    .line 31
    invoke-virtual {v1, v0, p0}, Li7;->r(Ljava/lang/String;Ljava/util/concurrent/Executor;)Ljd2;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    filled-new-array {p1, p0}, [Ljd2;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-static {p0}, Lbe2;->x(Ljava/util/List;)Ljd2;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public p()V
    .locals 0

    .line 1
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lj70;

    .line 4
    .line 5
    iget-object p0, p0, Lj70;->A:Lz70;

    .line 6
    .line 7
    invoke-virtual {p0}, Lz70;->L()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public q(Landroid/app/Activity;)V
    .locals 5

    .line 1
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ll80;

    .line 4
    .line 5
    iget-object v0, p0, Ll80;->c:Ljava/io/Serializable;

    .line 6
    .line 7
    check-cast v0, Ljava/util/ArrayList;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/4 v2, 0x0

    .line 14
    :cond_0
    if-ge v2, v1, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    add-int/lit8 v2, v2, 0x1

    .line 21
    .line 22
    check-cast v3, Ljava/lang/ref/WeakReference;

    .line 23
    .line 24
    invoke-virtual {v3}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    if-ne v4, p1, :cond_0

    .line 29
    .line 30
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    :cond_1
    invoke-virtual {p1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iget-object p0, p0, Ll80;->d:Ljava/lang/Object;

    .line 38
    .line 39
    check-cast p0, Lk80;

    .line 40
    .line 41
    invoke-virtual {p1, p0}, Landroid/view/Window;->removeOnFrameMetricsAvailableListener(Landroid/view/Window$OnFrameMetricsAvailableListener;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public r(Lr91;)V
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 5
    .line 6
    check-cast p0, Lt91;

    .line 7
    .line 8
    :cond_0
    sget-object v0, Lqe0;->d:Log0;

    .line 9
    .line 10
    sget-object v1, Lja;->a:Lsun/misc/Unsafe;

    .line 11
    .line 12
    sget-wide v2, Lt91;->n:J

    .line 13
    .line 14
    invoke-virtual {v1, p0, v2, v3}, Lsun/misc/Unsafe;->getObjectVolatile(Ljava/lang/Object;J)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    if-ne v1, v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    :cond_1
    move-object v2, v1

    .line 22
    check-cast v2, Lr91;

    .line 23
    .line 24
    instance-of v3, v2, Lqx0;

    .line 25
    .line 26
    if-eqz v3, :cond_2

    .line 27
    .line 28
    const/4 v3, 0x1

    .line 29
    goto :goto_0

    .line 30
    :cond_2
    sget-object v3, Lqe1;->b:Lqe1;

    .line 31
    .line 32
    invoke-static {v2, v3}, Ldl1;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    :goto_0
    if-eqz v3, :cond_3

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_3
    instance-of v3, v2, Lpt;

    .line 40
    .line 41
    if-eqz v3, :cond_4

    .line 42
    .line 43
    iget v3, p1, Lr91;->a:I

    .line 44
    .line 45
    iget v4, v2, Lr91;->a:I

    .line 46
    .line 47
    if-le v3, v4, :cond_5

    .line 48
    .line 49
    :goto_1
    move-object v2, p1

    .line 50
    goto :goto_2

    .line 51
    :cond_4
    instance-of v3, v2, Lp30;

    .line 52
    .line 53
    if-eqz v3, :cond_8

    .line 54
    .line 55
    :cond_5
    :goto_2
    if-nez v1, :cond_6

    .line 56
    .line 57
    move-object v1, v0

    .line 58
    :cond_6
    if-nez v2, :cond_7

    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_7
    move-object v0, v2

    .line 62
    :goto_3
    invoke-virtual {p0, v1, v0}, Lt91;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_0

    .line 67
    .line 68
    return-void

    .line 69
    :cond_8
    new-instance p0, Lrl;

    .line 70
    .line 71
    invoke-direct {p0}, Lrl;-><init>()V

    .line 72
    .line 73
    .line 74
    throw p0
.end method

.method public s(ILjava/lang/Object;Lc31;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lzk;

    .line 4
    .line 5
    check-cast p2, Li0;

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    invoke-virtual {p0, p1, v0}, Lzk;->B(II)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lzk;->a:Lbv1;

    .line 12
    .line 13
    invoke-interface {p3, p2, v0}, Lc31;->f(Ljava/lang/Object;Lbv1;)V

    .line 14
    .line 15
    .line 16
    const/4 p2, 0x4

    .line 17
    invoke-virtual {p0, p1, p2}, Lzk;->B(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    iget v0, p0, Lbv1;->j:I

    .line 2
    .line 3
    packed-switch v0, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0

    .line 11
    :pswitch_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v1, "ContentInfoCompat{"

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Landroid/view/ContentInfo;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string p0, "}"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :pswitch_data_0
    .packed-switch 0xc
        :pswitch_0
    .end packed-switch
.end method
