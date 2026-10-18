.class public final Lpa0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lpm0;
.implements Lig;
.implements Lo4;
.implements Lch;
.implements Lcs0;
.implements Lyr0;
.implements Lvr0;
.implements Lwp;
.implements Lpa1;
.implements Lkw0;
.implements Lr50;
.implements Lqv0;
.implements Lih1;
.implements Ljw0;
.implements Lx2;


# static fields
.field public static volatile l:Lpa0;

.field public static final m:Lda0;


# instance fields
.field public final synthetic j:I

.field public k:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lda0;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Lda0;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lpa0;->m:Lda0;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(I)V
    .locals 5

    .line 1
    iput p1, p0, Lpa0;->j:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    sparse-switch p1, :sswitch_data_0

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance p1, Ljava/util/HashSet;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lpa0;->k:Ljava/lang/Object;

    .line 16
    .line 17
    return-void

    .line 18
    :sswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance p1, Ljava/util/LinkedHashSet;

    .line 22
    .line 23
    invoke-direct {p1}, Ljava/util/LinkedHashSet;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lpa0;->k:Ljava/lang/Object;

    .line 27
    .line 28
    return-void

    .line 29
    :sswitch_1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    .line 31
    .line 32
    new-instance p1, Ljava/util/concurrent/CountDownLatch;

    .line 33
    .line 34
    invoke-direct {p1, v0}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lpa0;->k:Ljava/lang/Object;

    .line 38
    .line 39
    return-void

    .line 40
    :sswitch_2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    .line 42
    .line 43
    new-instance p1, Lny0;

    .line 44
    .line 45
    const/16 v0, 0x12

    .line 46
    .line 47
    invoke-direct {p1, v0}, Lny0;-><init>(I)V

    .line 48
    .line 49
    .line 50
    iput-object p1, p0, Lpa0;->k:Ljava/lang/Object;

    .line 51
    .line 52
    return-void

    .line 53
    :sswitch_3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :sswitch_4
    new-instance p1, Lfl0;

    .line 58
    .line 59
    sget-object v1, Ldw0;->c:Ldw0;

    .line 60
    .line 61
    :try_start_0
    const-string v1, "androidx.datastore.preferences.protobuf.DescriptorMessageInfoFactory"

    .line 62
    .line 63
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    const-string v2, "getInstance"

    .line 68
    .line 69
    const/4 v3, 0x0

    .line 70
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 71
    .line 72
    .line 73
    move-result-object v1

    .line 74
    invoke-virtual {v1, v3, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    check-cast v1, Lon0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :catch_0
    sget-object v1, Lpa0;->m:Lda0;

    .line 82
    .line 83
    :goto_0
    const/4 v2, 0x2

    .line 84
    new-array v2, v2, [Lon0;

    .line 85
    .line 86
    sget-object v3, Lda0;->b:Lda0;

    .line 87
    .line 88
    const/4 v4, 0x0

    .line 89
    aput-object v3, v2, v4

    .line 90
    .line 91
    aput-object v1, v2, v0

    .line 92
    .line 93
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object v2, p1, Lfl0;->a:[Lon0;

    .line 97
    .line 98
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 99
    .line 100
    .line 101
    sget-object v0, Llf0;->a:Ljava/nio/charset/Charset;

    .line 102
    .line 103
    iput-object p1, p0, Lpa0;->k:Ljava/lang/Object;

    .line 104
    .line 105
    return-void

    .line 106
    nop

    .line 107
    :sswitch_data_0
    .sparse-switch
        0x1 -> :sswitch_4
        0x6 -> :sswitch_3
        0x7 -> :sswitch_2
        0x9 -> :sswitch_1
        0x16 -> :sswitch_0
    .end sparse-switch
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 111
    iput p1, p0, Lpa0;->j:I

    iput-object p2, p0, Lpa0;->k:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/content/ClipData;I)V
    .locals 1

    const/16 v0, 0xa

    iput v0, p0, Lpa0;->j:I

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 126
    invoke-static {p1, p2}, Lvp;->d(Landroid/content/ClipData;I)Landroid/view/ContentInfo$Builder;

    move-result-object p1

    iput-object p1, p0, Lpa0;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .locals 2

    const/16 v0, 0x1a

    iput v0, p0, Lpa0;->j:I

    .line 114
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 115
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    .line 116
    new-instance v0, Lm81;

    const/4 v1, 0x6

    .line 117
    invoke-direct {v0, v1, p1}, Lny0;-><init>(ILjava/lang/Object;)V

    .line 118
    iput-object p1, v0, Lm81;->l:Landroid/view/View;

    .line 119
    iput-object v0, p0, Lpa0;->k:Ljava/lang/Object;

    goto :goto_0

    .line 120
    :cond_0
    new-instance v0, Lny0;

    const/4 v1, 0x6

    invoke-direct {v0, v1, p1}, Lny0;-><init>(ILjava/lang/Object;)V

    iput-object v0, p0, Lpa0;->k:Ljava/lang/Object;

    :goto_0
    return-void
.end method

.method public constructor <init>(Lcom/google/android/material/sidesheet/SideSheetBehavior;)V
    .locals 1

    const/16 v0, 0x19

    iput v0, p0, Lpa0;->j:I

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lpa0;->k:Ljava/lang/Object;

    .line 128
    new-instance p1, La3;

    const/16 v0, 0x8

    invoke-direct {p1, v0, p0}, La3;-><init>(ILjava/lang/Object;)V

    return-void
.end method

.method public constructor <init>(Lig1;)V
    .locals 9

    const/16 v0, 0x1c

    iput v0, p0, Lpa0;->j:I

    .line 121
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 122
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 123
    new-instance v7, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct {v7}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    const/4 v2, 0x0

    const v3, 0x7fffffff

    const-wide/16 v4, 0x3c

    .line 124
    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    move-object v8, p1

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    iput-object v1, p0, Lpa0;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ljg;)V
    .locals 1

    const/4 v0, 0x5

    iput v0, p0, Lpa0;->j:I

    .line 107
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lpa0;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lxk;)V
    .locals 1

    const/16 v0, 0x8

    iput v0, p0, Lpa0;->j:I

    .line 108
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 109
    sget-object v0, Lkf0;->a:Ljava/nio/charset/Charset;

    iput-object p1, p0, Lpa0;->k:Ljava/lang/Object;

    .line 110
    iput-object p0, p1, Lxk;->a:Lpa0;

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    const/4 v0, 0x4

    iput v0, p0, Lpa0;->j:I

    .line 112
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 113
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0, p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lpa0;->k:Ljava/lang/Object;

    return-void
.end method

.method public static t(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lorg/json/JSONObject;

    .line 7
    .line 8
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/os/BaseBundle;->keySet()Ljava/util/Set;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_0

    .line 24
    .line 25
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->get(Ljava/lang/String;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v4

    .line 35
    invoke-virtual {v1, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const-string p1, "name"

    .line 40
    .line 41
    invoke-virtual {v0, p1, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 42
    .line 43
    .line 44
    const-string p0, "parameters"

    .line 45
    .line 46
    invoke-virtual {v0, p0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    return-object p0
.end method


# virtual methods
.method public a()I
    .locals 1

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lpy0;

    .line 4
    .line 5
    iget v0, p0, Lpy0;->n:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lpy0;->z()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    sub-int/2addr v0, p0

    .line 12
    return v0
.end method

.method public b(Loo;)V
    .locals 1

    .line 1
    iget v0, p1, Loo;->k:I

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    const/4 v0, 0x0

    .line 8
    :goto_0
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Ljg;

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    invoke-virtual {p0}, Ljg;->r()Ljava/util/Set;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, p1, v0}, Ljg;->k(Lgd0;Ljava/util/Set;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_1
    iget-object p0, p0, Ljg;->y:Lhg;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    invoke-interface {p0, p1}, Lhg;->b(Loo;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    return-void
.end method

.method public build()Lzp;
    .locals 2

    .line 1
    new-instance v0, Lzp;

    .line 2
    .line 3
    new-instance v1, Lbv1;

    .line 4
    .line 5
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Landroid/view/ContentInfo$Builder;

    .line 8
    .line 9
    invoke-static {p0}, Lvp;->e(Landroid/view/ContentInfo$Builder;)Landroid/view/ContentInfo;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-direct {v1, p0}, Lbv1;-><init>(Landroid/view/ContentInfo;)V

    .line 14
    .line 15
    .line 16
    invoke-direct {v0, v1}, Lzp;-><init>(Lyp;)V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public c(Landroid/net/Uri;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroid/view/ContentInfo$Builder;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lvp;->i(Landroid/view/ContentInfo$Builder;Landroid/net/Uri;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e(Lrm0;Landroid/view/MenuItem;)Z
    .locals 0

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroidx/appcompat/widget/ActionMenuView;

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/appcompat/widget/ActionMenuView;->I:Lx2;

    .line 6
    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    check-cast p0, Lpa0;

    .line 10
    .line 11
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 12
    .line 13
    check-cast p0, Landroidx/appcompat/widget/Toolbar;

    .line 14
    .line 15
    iget-object p0, p0, Landroidx/appcompat/widget/Toolbar;->P:Lc9;

    .line 16
    .line 17
    iget-object p0, p0, Lc9;->m:Ljava/lang/Object;

    .line 18
    .line 19
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    if-eqz p1, :cond_1

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Ls70;

    .line 36
    .line 37
    iget-object p1, p1, Ls70;->a:Lz70;

    .line 38
    .line 39
    invoke-virtual {p1}, Lz70;->o()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    const/4 p0, 0x1

    .line 46
    return p0

    .line 47
    :cond_1
    const/4 p0, 0x0

    .line 48
    return p0
.end method

.method public f(Landroid/view/View;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lqy0;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lqy0;

    .line 16
    .line 17
    iget-object p1, p1, Lqy0;->b:Landroid/graphics/Rect;

    .line 18
    .line 19
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 20
    .line 21
    sub-int/2addr v0, p1

    .line 22
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    .line 23
    .line 24
    sub-int/2addr v0, p0

    .line 25
    return v0
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/concurrent/CountDownLatch;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public get()Ljava/lang/Object;
    .locals 4

    .line 1
    iget v0, p0, Lpa0;->j:I

    .line 2
    .line 3
    sparse-switch v0, :sswitch_data_0

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 7
    .line 8
    check-cast p0, Ljw0;

    .line 9
    .line 10
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lq71;

    .line 15
    .line 16
    new-instance v0, Lj51;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Lj51;-><init>(Lq71;)V

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :sswitch_0
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p0, Lkw0;

    .line 25
    .line 26
    invoke-interface {p0}, Lkw0;->get()Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    check-cast p0, Landroid/content/Context;

    .line 31
    .line 32
    sget v0, Le31;->m:I

    .line 33
    .line 34
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v0

    .line 42
    new-instance v1, Le31;

    .line 43
    .line 44
    const-string v2, "com.google.android.datatransport.events"

    .line 45
    .line 46
    invoke-direct {v1, v0, p0, v2}, Le31;-><init>(ILandroid/content/Context;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-object v1

    .line 50
    :sswitch_1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 51
    .line 52
    return-object p0

    .line 53
    :sswitch_2
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast p0, Lpa0;

    .line 56
    .line 57
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast p0, Landroid/content/Context;

    .line 60
    .line 61
    new-instance v0, Ltb0;

    .line 62
    .line 63
    const/16 v1, 0x17

    .line 64
    .line 65
    invoke-direct {v0, v1}, Ltb0;-><init>(I)V

    .line 66
    .line 67
    .line 68
    new-instance v1, Lt11;

    .line 69
    .line 70
    const/16 v2, 0x16

    .line 71
    .line 72
    invoke-direct {v1, v2}, Lt11;-><init>(I)V

    .line 73
    .line 74
    .line 75
    new-instance v2, Lc9;

    .line 76
    .line 77
    const/16 v3, 0x9

    .line 78
    .line 79
    invoke-direct {v2, p0, v0, v1, v3}, Lc9;-><init>(Landroid/content/Context;Ljava/lang/Object;Ljava/lang/Object;I)V

    .line 80
    .line 81
    .line 82
    return-object v2

    .line 83
    :sswitch_data_0
    .sparse-switch
        0xd -> :sswitch_2
        0xf -> :sswitch_1
        0x17 -> :sswitch_0
    .end sparse-switch
.end method

.method public h(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/concurrent/CountDownLatch;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public i(Lqr;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    return-void
.end method

.method public j(ILjava/lang/Object;)V
    .locals 1

    .line 1
    const/4 v0, 0x6

    .line 2
    if-eq p1, v0, :cond_0

    .line 3
    .line 4
    const/4 v0, 0x7

    .line 5
    if-eq p1, v0, :cond_0

    .line 6
    .line 7
    const/16 v0, 0x8

    .line 8
    .line 9
    if-eq p1, v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    check-cast p2, Ljava/lang/Throwable;

    .line 13
    .line 14
    :goto_0
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 15
    .line 16
    check-cast p0, Landroidx/profileinstaller/ProfileInstallReceiver;

    .line 17
    .line 18
    invoke-virtual {p0, p1}, Landroid/content/BroadcastReceiver;->setResultCode(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public k(I)Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lpy0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lpy0;->t(I)Landroid/view/View;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public l(Lrm0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroidx/appcompat/widget/ActionMenuView;

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/appcompat/widget/ActionMenuView;->D:Lny0;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Lny0;->l(Lrm0;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public m()I
    .locals 0

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lpy0;

    .line 4
    .line 5
    invoke-virtual {p0}, Lpy0;->C()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public n(Landroid/view/View;)I
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Lqy0;

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getBottom()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lqy0;

    .line 16
    .line 17
    iget-object p1, p1, Lqy0;->b:Landroid/graphics/Rect;

    .line 18
    .line 19
    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    .line 20
    .line 21
    add-int/2addr v0, p1

    .line 22
    iget p0, p0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 23
    .line 24
    add-int/2addr v0, p0

    .line 25
    return v0
.end method

.method public o(Ljava/lang/Object;)Ljd2;
    .locals 2

    .line 1
    check-cast p1, Lp51;

    .line 2
    .line 3
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Ls7;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    invoke-static {v0}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p0, Lor;

    .line 18
    .line 19
    sget-object p1, Lor;->r:Ly1;

    .line 20
    .line 21
    invoke-virtual {p0}, Lor;->d()Ljd2;

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Lor;->m:Li7;

    .line 25
    .line 26
    iget-object v1, p0, Lor;->e:Lc9;

    .line 27
    .line 28
    iget-object v1, v1, Lc9;->k:Ljava/lang/Object;

    .line 29
    .line 30
    check-cast v1, Lzs;

    .line 31
    .line 32
    invoke-virtual {p1, v0, v1}, Li7;->r(Ljava/lang/String;Ljava/util/concurrent/Executor;)Ljd2;

    .line 33
    .line 34
    .line 35
    iget-object p0, p0, Lor;->q:Llb1;

    .line 36
    .line 37
    invoke-virtual {p0, v0}, Llb1;->b(Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v0}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    return-object p0
.end method

.method public onEvent(Ljava/lang/String;Landroid/os/Bundle;)V
    .locals 8

    .line 1
    const-string v0, "$A$:"

    .line 2
    .line 3
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 4
    .line 5
    check-cast p0, Lqr;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    :try_start_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p1, p2}, Lpa0;->t(Ljava/lang/String;Landroid/os/Bundle;)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v6

    .line 25
    iget-object v3, p0, Lqr;->a:Lsr;

    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 31
    .line 32
    .line 33
    move-result-wide p0

    .line 34
    iget-wide v0, v3, Lsr;->d:J

    .line 35
    .line 36
    sub-long v4, p0, v0

    .line 37
    .line 38
    iget-object p0, v3, Lsr;->o:Lc9;

    .line 39
    .line 40
    iget-object p0, p0, Lc9;->k:Ljava/lang/Object;

    .line 41
    .line 42
    check-cast p0, Lzs;

    .line 43
    .line 44
    new-instance v2, Lrr;

    .line 45
    .line 46
    const/4 v7, 0x0

    .line 47
    invoke-direct/range {v2 .. v7}, Lrr;-><init>(Lsr;JLjava/lang/String;I)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0, v2}, Lzs;->a(Ljava/lang/Runnable;)Ljd2;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    :catch_0
    :cond_0
    return-void
.end method

.method public p(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ljava/util/concurrent/CountDownLatch;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public q(Ls50;Lkq;)Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Ls7;

    .line 4
    .line 5
    new-instance v0, Lju;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, v1, p1}, Lju;-><init>(ILjava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v0, p2}, Ls7;->q(Ls50;Lkq;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    sget-object p1, Lar;->j:Lar;

    .line 16
    .line 17
    if-ne p0, p1, :cond_0

    .line 18
    .line 19
    return-object p0

    .line 20
    :cond_0
    sget-object p0, Lwe1;->a:Lwe1;

    .line 21
    .line 22
    return-object p0
.end method

.method public r(Ljava/lang/Object;)Ljava/lang/String;
    .locals 6

    .line 1
    new-instance v1, Ljava/io/StringWriter;

    .line 2
    .line 3
    invoke-direct {v1}, Ljava/io/StringWriter;-><init>()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    new-instance v0, Lah0;

    .line 7
    .line 8
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Lug0;

    .line 11
    .line 12
    iget-object v2, p0, Lug0;->a:Ljava/util/HashMap;

    .line 13
    .line 14
    iget-object v3, p0, Lug0;->b:Ljava/util/HashMap;

    .line 15
    .line 16
    iget-object v4, p0, Lug0;->c:Lrg0;

    .line 17
    .line 18
    iget-boolean v5, p0, Lug0;->d:Z

    .line 19
    .line 20
    invoke-direct/range {v0 .. v5}, Lah0;-><init>(Ljava/io/Writer;Ljava/util/HashMap;Ljava/util/HashMap;Lrg0;Z)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p1}, Lah0;->h(Ljava/lang/Object;)Lah0;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Lah0;->j()V

    .line 27
    .line 28
    .line 29
    iget-object p0, v0, Lah0;->b:Landroid/util/JsonWriter;

    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/util/JsonWriter;->flush()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    .line 33
    .line 34
    :catch_0
    invoke-virtual {v1}, Ljava/io/StringWriter;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method public s(Ldn;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 7

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    check-cast v1, Lor;

    .line 5
    .line 6
    monitor-enter v1

    .line 7
    :try_start_0
    invoke-static {p3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    invoke-static {}, Lea1;->h()V

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    move-result-wide v2

    .line 20
    iget-object p0, v1, Lor;->e:Lc9;

    .line 21
    .line 22
    iget-object p0, p0, Lc9;->k:Ljava/lang/Object;

    .line 23
    .line 24
    check-cast p0, Lzs;

    .line 25
    .line 26
    new-instance v0, Lmr;

    .line 27
    .line 28
    move-object v6, p1

    .line 29
    move-object v5, p2

    .line 30
    move-object v4, p3

    .line 31
    invoke-direct/range {v0 .. v6}, Lmr;-><init>(Lor;JLjava/lang/Throwable;Ljava/lang/Thread;Ldn;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Lzs;->k:Ljava/lang/Object;

    .line 35
    .line 36
    monitor-enter p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    :try_start_1
    iget-object p2, p0, Lzs;->l:Ljd2;

    .line 38
    .line 39
    iget-object p3, p0, Lzs;->j:Ljava/util/concurrent/ExecutorService;

    .line 40
    .line 41
    new-instance v2, Lfj;

    .line 42
    .line 43
    const/4 v3, 0x4

    .line 44
    invoke-direct {v2, v3, v0}, Lfj;-><init>(ILjava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p2, p3, v2}, Ljd2;->f(Ljava/util/concurrent/Executor;Ljq;)Ljd2;

    .line 48
    .line 49
    .line 50
    move-result-object p2

    .line 51
    iput-object p2, p0, Lzs;->l:Ljd2;

    .line 52
    .line 53
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 54
    :try_start_2
    invoke-static {p2}, Llg1;->a(Ljd2;)V
    :try_end_2
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_2 .. :try_end_2} :catch_0
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception v0

    .line 59
    move-object p0, v0

    .line 60
    goto :goto_1

    .line 61
    :catch_0
    :goto_0
    monitor-exit v1

    .line 62
    return-void

    .line 63
    :catchall_1
    move-exception v0

    .line 64
    move-object p0, v0

    .line 65
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 66
    :try_start_4
    throw p0

    .line 67
    :goto_1
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 68
    throw p0
.end method

.method public setExtras(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroid/view/ContentInfo$Builder;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lvp;->j(Landroid/view/ContentInfo$Builder;Landroid/os/Bundle;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setFlags(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroid/view/ContentInfo$Builder;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lvp;->h(Landroid/view/ContentInfo$Builder;I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public u(ILjava/lang/Object;Lb31;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lxk;

    .line 4
    .line 5
    check-cast p2, Lh0;

    .line 6
    .line 7
    const/4 v0, 0x3

    .line 8
    invoke-virtual {p0, p1, v0}, Lxk;->m(II)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lxk;->a:Lpa0;

    .line 12
    .line 13
    invoke-interface {p3, p2, v0}, Lb31;->g(Ljava/lang/Object;Lpa0;)V

    .line 14
    .line 15
    .line 16
    const/4 p2, 0x4

    .line 17
    invoke-virtual {p0, p1, p2}, Lxk;->m(II)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public v(ILjava/lang/Object;Lb31;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lpa0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lxk;

    .line 4
    .line 5
    check-cast p2, Lh0;

    .line 6
    .line 7
    const/4 v0, 0x2

    .line 8
    invoke-virtual {p0, p1, v0}, Lxk;->m(II)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, p3}, Lh0;->g(Lb31;)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    invoke-virtual {p0, p1}, Lxk;->n(I)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lxk;->a:Lpa0;

    .line 19
    .line 20
    invoke-interface {p3, p2, p0}, Lb31;->g(Ljava/lang/Object;Lpa0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
