.class public Ls7;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lpa1;
.implements Lwi;
.implements Lj00;
.implements Lr50;


# static fields
.field public static final m:[I

.field public static final n:Lok0;


# instance fields
.field public final synthetic j:I

.field public k:Ljava/lang/Object;

.field public l:Ljava/lang/Object;


# direct methods
.method static synthetic constructor <clinit>()V
    .locals 2

    .line 1
    const v0, 0x101013b

    .line 2
    .line 3
    .line 4
    const v1, 0x101013c

    .line 5
    .line 6
    .line 7
    filled-new-array {v0, v1}, [I

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ls7;->m:[I

    .line 12
    .line 13
    new-instance v0, Lok0;

    .line 14
    .line 15
    const/16 v1, 0x11

    .line 16
    .line 17
    invoke-direct {v0, v1}, Lok0;-><init>(I)V

    .line 18
    .line 19
    .line 20
    sput-object v0, Ls7;->n:Lok0;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/16 v0, 0x1c

    iput v0, p0, Ls7;->j:I

    .line 127
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 128
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Ls7;->k:Ljava/lang/Object;

    .line 129
    new-instance v0, Landroid/util/SparseIntArray;

    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    iput-object v0, p0, Ls7;->l:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(I)V
    .locals 0

    .line 90
    iput p1, p0, Ls7;->j:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(II)V
    .locals 1

    const/16 v0, 0x1b

    iput v0, p0, Ls7;->j:I

    .line 119
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 120
    filled-new-array {p1, p2}, [I

    move-result-object p1

    iput-object p1, p0, Ls7;->k:Ljava/lang/Object;

    const/4 p1, 0x2

    .line 121
    new-array p1, p1, [F

    fill-array-data p1, :array_0

    iput-object p1, p0, Ls7;->l:Ljava/lang/Object;

    return-void

    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public constructor <init>(III)V
    .locals 1

    const/16 v0, 0x1b

    iput v0, p0, Ls7;->j:I

    .line 122
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 123
    filled-new-array {p1, p2, p3}, [I

    move-result-object p1

    iput-object p1, p0, Ls7;->k:Ljava/lang/Object;

    const/4 p1, 0x3

    .line 124
    new-array p1, p1, [F

    fill-array-data p1, :array_0

    iput-object p1, p0, Ls7;->l:Ljava/lang/Object;

    return-void

    :array_0
    .array-data 4
        0x0
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public synthetic constructor <init>(ILjava/lang/Object;)V
    .locals 0

    .line 81
    iput p1, p0, Ls7;->j:I

    iput-object p2, p0, Ls7;->k:Ljava/lang/Object;

    const/4 p1, 0x0

    iput-object p1, p0, Ls7;->l:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Landroid/animation/Animator;)V
    .locals 1

    const/16 v0, 0x19

    iput v0, p0, Ls7;->j:I

    .line 110
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 111
    iput-object v0, p0, Ls7;->k:Ljava/lang/Object;

    .line 112
    iput-object p1, p0, Ls7;->l:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/widget/AbsSeekBar;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, Ls7;->j:I

    .line 88
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 89
    iput-object p1, p0, Ls7;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Landroid/widget/EditText;I)V
    .locals 3

    .line 1
    iput p2, p0, Ls7;->j:I

    .line 2
    .line 3
    packed-switch p2, :pswitch_data_0

    .line 4
    .line 5
    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ls7;->k:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance p2, Lbv1;

    .line 12
    .line 13
    invoke-direct {p2, p1}, Lbv1;-><init>(Landroid/widget/EditText;)V

    .line 14
    .line 15
    .line 16
    iput-object p2, p0, Ls7;->l:Ljava/lang/Object;

    .line 17
    .line 18
    return-void

    .line 19
    :pswitch_0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ls7;->k:Ljava/lang/Object;

    .line 23
    .line 24
    new-instance p2, Lo00;

    .line 25
    .line 26
    invoke-direct {p2, p1}, Lo00;-><init>(Landroid/widget/EditText;)V

    .line 27
    .line 28
    .line 29
    iput-object p2, p0, Ls7;->l:Ljava/lang/Object;

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Landroid/widget/TextView;->addTextChangedListener(Landroid/text/TextWatcher;)V

    .line 32
    .line 33
    .line 34
    sget-object p0, Ld00;->b:Ld00;

    .line 35
    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    sget-object p0, Ld00;->a:Ljava/lang/Object;

    .line 39
    .line 40
    monitor-enter p0

    .line 41
    :try_start_0
    sget-object p2, Ld00;->b:Ld00;

    .line 42
    .line 43
    if-nez p2, :cond_0

    .line 44
    .line 45
    new-instance p2, Ld00;

    .line 46
    .line 47
    invoke-direct {p2}, Landroid/text/Editable$Factory;-><init>()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 48
    .line 49
    .line 50
    :try_start_1
    const-string v0, "android.text.DynamicLayout$ChangeWatcher"

    .line 51
    .line 52
    const-class v1, Ld00;

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    const/4 v2, 0x0

    .line 59
    invoke-static {v0, v2, v1}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    sput-object v0, Ld00;->c:Ljava/lang/Class;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    .line 65
    :catchall_0
    :try_start_2
    sput-object p2, Ld00;->b:Ld00;

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catchall_1
    move-exception p1

    .line 69
    goto :goto_1

    .line 70
    :cond_0
    :goto_0
    monitor-exit p0

    .line 71
    goto :goto_2

    .line 72
    :goto_1
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 73
    throw p1

    .line 74
    :cond_1
    :goto_2
    sget-object p0, Ld00;->b:Ld00;

    .line 75
    .line 76
    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setEditableFactory(Landroid/text/Editable$Factory;)V

    .line 77
    .line 78
    .line 79
    return-void

    .line 80
    nop

    .line 81
    :pswitch_data_0
    .packed-switch 0x13
        :pswitch_0
    .end packed-switch
.end method

.method public constructor <init>(Landroidx/cardview/widget/CardView;)V
    .locals 1

    const/16 v0, 0x9

    iput v0, p0, Ls7;->j:I

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls7;->l:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;ILjava/lang/Object;)V
    .locals 0

    .line 82
    iput p2, p0, Ls7;->j:I

    iput-object p1, p0, Ls7;->l:Ljava/lang/Object;

    iput-object p3, p0, Ls7;->k:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    .locals 0

    .line 83
    iput p3, p0, Ls7;->j:I

    iput-object p1, p0, Ls7;->k:Ljava/lang/Object;

    iput-object p2, p0, Ls7;->l:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;I)V
    .locals 0

    .line 84
    iput p4, p0, Ls7;->j:I

    iput-object p1, p0, Ls7;->l:Ljava/lang/Object;

    iput-object p2, p0, Ls7;->k:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/util/ArrayList;Ljava/util/ArrayList;)V
    .locals 4

    const/16 v0, 0x1b

    iput v0, p0, Ls7;->j:I

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 114
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    .line 115
    new-array v1, v0, [I

    iput-object v1, p0, Ls7;->k:Ljava/lang/Object;

    .line 116
    new-array v1, v0, [F

    iput-object v1, p0, Ls7;->l:Ljava/lang/Object;

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 117
    iget-object v2, p0, Ls7;->k:Ljava/lang/Object;

    check-cast v2, [I

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    aput v3, v2, v1

    .line 118
    iget-object v2, p0, Ls7;->l:Ljava/lang/Object;

    check-cast v2, [F

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Float;

    invoke-virtual {v3}, Ljava/lang/Float;->floatValue()F

    move-result v3

    aput v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public constructor <init>(Ljava/util/regex/Matcher;Ljava/lang/String;)V
    .locals 0

    const/16 p2, 0x1d

    iput p2, p0, Ls7;->j:I

    .line 125
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls7;->k:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lm30;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, Ls7;->j:I

    .line 85
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 86
    iput-object p1, p0, Ls7;->k:Ljava/lang/Object;

    .line 87
    sget-object p1, Ls7;->n:Lok0;

    iput-object p1, p0, Ls7;->l:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Ls7;)V
    .locals 3

    const/16 v0, 0x11

    iput v0, p0, Ls7;->j:I

    .line 97
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 98
    iget-object p1, p1, Ls7;->k:Ljava/lang/Object;

    check-cast p1, Landroid/content/Context;

    .line 99
    const-string v0, "com.google.firebase.crashlytics.unity_version"

    const-string v1, "string"

    invoke-static {p1, v0, v1}, Lml;->p(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    .line 100
    const-string v1, "Unity"

    iput-object v1, p0, Ls7;->k:Ljava/lang/Object;

    .line 101
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Ls7;->l:Ljava/lang/Object;

    goto :goto_1

    .line 102
    :cond_0
    const-string v0, "flutter_assets/NOTICES.Z"

    .line 103
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_1

    goto :goto_0

    .line 104
    :cond_1
    :try_start_0
    invoke-virtual {p1}, Landroid/content/Context;->getAssets()Landroid/content/res/AssetManager;

    move-result-object p1

    invoke-virtual {p1, v0}, Landroid/content/res/AssetManager;->open(Ljava/lang/String;)Ljava/io/InputStream;

    move-result-object p1

    if-eqz p1, :cond_2

    .line 105
    invoke-virtual {p1}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 106
    :cond_2
    const-string p1, "Flutter"

    iput-object p1, p0, Ls7;->k:Ljava/lang/Object;

    .line 107
    iput-object v2, p0, Ls7;->l:Ljava/lang/Object;

    goto :goto_1

    .line 108
    :catch_0
    :goto_0
    iput-object v2, p0, Ls7;->k:Ljava/lang/Object;

    .line 109
    iput-object v2, p0, Ls7;->l:Ljava/lang/Object;

    :goto_1
    return-void
.end method

.method public constructor <init>(Lu30;Lh40;Ldn;Lxm;Landroid/content/Context;Ljava/lang/String;Lmn;Ljava/util/concurrent/ScheduledExecutorService;)V
    .locals 11

    const/16 v0, 0xa

    iput v0, p0, Ls7;->j:I

    .line 91
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 92
    new-instance v8, Ljava/util/LinkedHashSet;

    invoke-direct {v8}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object v8, p0, Ls7;->k:Ljava/lang/Object;

    .line 93
    new-instance v1, Ljn;

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move-object v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move-object/from16 v9, p7

    move-object/from16 v10, p8

    invoke-direct/range {v1 .. v10}, Ljn;-><init>(Lu30;Lh40;Ldn;Lxm;Landroid/content/Context;Ljava/lang/String;Ljava/util/LinkedHashSet;Lmn;Ljava/util/concurrent/ScheduledExecutorService;)V

    iput-object v1, p0, Ls7;->l:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(Lz70;)V
    .locals 1

    const/16 v0, 0x1a

    iput v0, p0, Ls7;->j:I

    .line 94
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 95
    new-instance v0, Ljava/util/concurrent/CopyOnWriteArrayList;

    invoke-direct {v0}, Ljava/util/concurrent/CopyOnWriteArrayList;-><init>()V

    iput-object v0, p0, Ls7;->k:Ljava/lang/Object;

    .line 96
    iput-object p1, p0, Ls7;->l:Ljava/lang/Object;

    return-void
.end method

.method public static c(Landroid/content/Context;)Ls7;
    .locals 5

    .line 1
    const-string v0, "generatefid.lock"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    new-instance v2, Ljava/io/File;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-direct {v2, p0, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance p0, Ljava/io/RandomAccessFile;

    .line 14
    .line 15
    const-string v0, "rw"

    .line 16
    .line 17
    invoke-direct {p0, v2, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 21
    .line 22
    .line 23
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/nio/channels/OverlappingFileLockException; {:try_start_0 .. :try_end_0} :catch_1

    .line 24
    :try_start_1
    invoke-virtual {p0}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    .line 25
    .line 26
    .line 27
    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/Error; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/nio/channels/OverlappingFileLockException; {:try_start_1 .. :try_end_1} :catch_0

    .line 28
    :try_start_2
    new-instance v2, Ls7;

    .line 29
    .line 30
    const/16 v3, 0xf

    .line 31
    .line 32
    const/4 v4, 0x0

    .line 33
    invoke-direct {v2, p0, v0, v3, v4}, Ls7;-><init>(Ljava/lang/Object;Ljava/lang/Object;IZ)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/lang/Error; {:try_start_2 .. :try_end_2} :catch_2
    .catch Ljava/nio/channels/OverlappingFileLockException; {:try_start_2 .. :try_end_2} :catch_2

    .line 34
    .line 35
    .line 36
    return-object v2

    .line 37
    :catch_0
    move-object v0, v1

    .line 38
    goto :goto_0

    .line 39
    :catch_1
    move-object p0, v1

    .line 40
    move-object v0, p0

    .line 41
    :catch_2
    :goto_0
    if-eqz v0, :cond_0

    .line 42
    .line 43
    :try_start_3
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 44
    .line 45
    .line 46
    :catch_3
    :cond_0
    if-eqz p0, :cond_1

    .line 47
    .line 48
    :try_start_4
    invoke-virtual {p0}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 49
    .line 50
    .line 51
    :catch_4
    :cond_1
    return-object v1
.end method

.method public static x(II)I
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    move v1, v0

    .line 3
    move v2, v1

    .line 4
    move v3, v2

    .line 5
    :goto_0
    const/4 v4, 0x1

    .line 6
    if-ge v1, p0, :cond_2

    .line 7
    .line 8
    add-int/lit8 v2, v2, 0x1

    .line 9
    .line 10
    if-ne v2, p1, :cond_0

    .line 11
    .line 12
    add-int/lit8 v3, v3, 0x1

    .line 13
    .line 14
    move v2, v0

    .line 15
    goto :goto_1

    .line 16
    :cond_0
    if-le v2, p1, :cond_1

    .line 17
    .line 18
    add-int/lit8 v3, v3, 0x1

    .line 19
    .line 20
    move v2, v4

    .line 21
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_2
    add-int/2addr v2, v4

    .line 25
    if-le v2, p1, :cond_3

    .line 26
    .line 27
    add-int/2addr v3, v4

    .line 28
    :cond_3
    return v3
.end method


# virtual methods
.method public A(Landroid/view/inputmethod/InputConnection;Landroid/view/inputmethod/EditorInfo;)Lf00;
    .locals 1

    .line 1
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lbv1;

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    goto :goto_1

    .line 9
    :cond_0
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Ls7;

    .line 12
    .line 13
    instance-of v0, p1, Lf00;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    new-instance v0, Lf00;

    .line 19
    .line 20
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 21
    .line 22
    check-cast p0, Landroid/widget/EditText;

    .line 23
    .line 24
    invoke-direct {v0, p2, p1, p0}, Lf00;-><init>(Landroid/view/inputmethod/EditorInfo;Landroid/view/inputmethod/InputConnection;Landroid/widget/TextView;)V

    .line 25
    .line 26
    .line 27
    move-object p1, v0

    .line 28
    :goto_0
    move-object p0, p1

    .line 29
    :goto_1
    check-cast p0, Lf00;

    .line 30
    .line 31
    return-object p0
.end method

.method public B(Ly2;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ls7;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ler0;

    .line 4
    .line 5
    iget-object v1, v0, Ler0;->l:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Landroid/view/ActionMode$Callback;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ler0;->i(Ly2;)Lwa1;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {v1, p1}, Landroid/view/ActionMode$Callback;->onDestroyActionMode(Landroid/view/ActionMode;)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ls7;->l:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast p1, Lg7;

    .line 19
    .line 20
    iget-object v0, p1, Lg7;->E:Landroid/widget/PopupWindow;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object v0, p1, Lg7;->u:Landroid/view/Window;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p1, Lg7;->F:Lv6;

    .line 31
    .line 32
    invoke-virtual {v0, v1}, Landroid/view/View;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 33
    .line 34
    .line 35
    :cond_0
    iget-object v0, p1, Lg7;->D:Landroidx/appcompat/widget/ActionBarContextView;

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iget-object v0, p1, Lg7;->G:Lmi1;

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    invoke-virtual {v0}, Lmi1;->b()V

    .line 44
    .line 45
    .line 46
    :cond_1
    iget-object v0, p1, Lg7;->D:Landroidx/appcompat/widget/ActionBarContextView;

    .line 47
    .line 48
    invoke-static {v0}, Lzh1;->a(Landroid/view/View;)Lmi1;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const/4 v1, 0x0

    .line 53
    invoke-virtual {v0, v1}, Lmi1;->a(F)V

    .line 54
    .line 55
    .line 56
    iput-object v0, p1, Lg7;->G:Lmi1;

    .line 57
    .line 58
    new-instance v1, Lu6;

    .line 59
    .line 60
    const/4 v2, 0x2

    .line 61
    invoke-direct {v1, v2, p0}, Lu6;-><init>(ILjava/lang/Object;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0, v1}, Lmi1;->d(Loi1;)V

    .line 65
    .line 66
    .line 67
    :cond_2
    const/4 p0, 0x0

    .line 68
    iput-object p0, p1, Lg7;->C:Ly2;

    .line 69
    .line 70
    iget-object p0, p1, Lg7;->J:Landroid/view/ViewGroup;

    .line 71
    .line 72
    sget-object v0, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 73
    .line 74
    invoke-static {p0}, Lmh1;->c(Landroid/view/View;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Lg7;->G()V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public C(ILandroid/os/Bundle;)V
    .locals 2

    .line 1
    sget-object p1, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    const-string p1, "name"

    .line 7
    .line 8
    invoke-virtual {p2, p1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    if-eqz p1, :cond_3

    .line 13
    .line 14
    const-string v0, "params"

    .line 15
    .line 16
    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    if-nez p2, :cond_0

    .line 21
    .line 22
    new-instance p2, Landroid/os/Bundle;

    .line 23
    .line 24
    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    .line 25
    .line 26
    .line 27
    :cond_0
    const-string v0, "_o"

    .line 28
    .line 29
    invoke-virtual {p2, v0}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const-string v1, "clx"

    .line 34
    .line 35
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 42
    .line 43
    check-cast p0, Lc9;

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_1
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 47
    .line 48
    check-cast p0, Lpa0;

    .line 49
    .line 50
    :goto_0
    if-nez p0, :cond_2

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_2
    invoke-interface {p0, p1, p2}, Lo4;->onEvent(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 54
    .line 55
    .line 56
    :cond_3
    :goto_1
    return-void
.end method

.method public D(Ly2;Landroid/view/Menu;)Z
    .locals 4

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lg7;

    .line 4
    .line 5
    iget-object v0, v0, Lg7;->J:Landroid/view/ViewGroup;

    .line 6
    .line 7
    sget-object v1, Lzh1;->a:Ljava/util/WeakHashMap;

    .line 8
    .line 9
    invoke-static {v0}, Lmh1;->c(Landroid/view/View;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast p0, Ler0;

    .line 15
    .line 16
    iget-object v0, p0, Ler0;->l:Ljava/lang/Object;

    .line 17
    .line 18
    check-cast v0, Landroid/view/ActionMode$Callback;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ler0;->i(Ly2;)Lwa1;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iget-object v1, p0, Ler0;->n:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v1, Lu71;

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual {v1, p2, v2}, Lu71;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    check-cast v2, Landroid/view/Menu;

    .line 34
    .line 35
    if-nez v2, :cond_0

    .line 36
    .line 37
    new-instance v2, Lln0;

    .line 38
    .line 39
    iget-object p0, p0, Ler0;->k:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast p0, Landroid/content/Context;

    .line 42
    .line 43
    move-object v3, p2

    .line 44
    check-cast v3, Lrm0;

    .line 45
    .line 46
    invoke-direct {v2, p0, v3}, Lln0;-><init>(Landroid/content/Context;Lrm0;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v1, p2, v2}, Lu71;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    :cond_0
    invoke-interface {v0, p1, v2}, Landroid/view/ActionMode$Callback;->onPrepareActionMode(Landroid/view/ActionMode;Landroid/view/Menu;)Z

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    return p0
.end method

.method public E(Lp60;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/os/Handler;

    .line 4
    .line 5
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Lny0;

    .line 8
    .line 9
    iget v1, p1, Lp60;->b:I

    .line 10
    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    iget-object p1, p1, Lp60;->a:Landroid/graphics/Typeface;

    .line 14
    .line 15
    new-instance v1, Loi;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Loi;-><init>(Lny0;Landroid/graphics/Typeface;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    new-instance p1, Lpi;

    .line 25
    .line 26
    invoke-direct {p1, p0, v1}, Lpi;-><init>(Lny0;I)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public F(Landroid/content/Context;Landroid/content/res/XmlResourceParser;)V
    .locals 9

    .line 1
    new-instance v0, Lop;

    .line 2
    .line 3
    invoke-direct {v0}, Lop;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeCount()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    :goto_0
    if-ge v2, v1, :cond_e

    .line 12
    .line 13
    invoke-interface {p2, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeName(I)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v3

    .line 17
    const-string v4, "id"

    .line 18
    .line 19
    invoke-virtual {v4, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_d

    .line 24
    .line 25
    invoke-interface {p2, v2}, Lorg/xmlpull/v1/XmlPullParser;->getAttributeValue(I)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const-string v2, "/"

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    const/4 v3, -0x1

    .line 36
    const/4 v5, 0x1

    .line 37
    if-eqz v2, :cond_0

    .line 38
    .line 39
    const/16 v2, 0x2f

    .line 40
    .line 41
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    add-int/2addr v2, v5

    .line 46
    invoke-virtual {v1, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v7

    .line 58
    invoke-virtual {v6, v2, v4, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    move-result v2

    .line 62
    goto :goto_1

    .line 63
    :cond_0
    move v2, v3

    .line 64
    :goto_1
    if-ne v2, v3, :cond_1

    .line 65
    .line 66
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-le v3, v5, :cond_1

    .line 71
    .line 72
    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v2

    .line 80
    :cond_1
    :try_start_0
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 81
    .line 82
    .line 83
    move-result v1
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 84
    const/4 v3, 0x0

    .line 85
    move-object v4, v3

    .line 86
    :goto_2
    if-eq v1, v5, :cond_c

    .line 87
    .line 88
    if-eqz v1, :cond_a

    .line 89
    .line 90
    const/4 v6, 0x2

    .line 91
    const-string v7, "Constraint"

    .line 92
    .line 93
    if-eq v1, v6, :cond_4

    .line 94
    .line 95
    const/4 v6, 0x3

    .line 96
    if-eq v1, v6, :cond_2

    .line 97
    .line 98
    goto/16 :goto_3

    .line 99
    .line 100
    :cond_2
    :try_start_1
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    const-string v6, "ConstraintSet"

    .line 105
    .line 106
    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 107
    .line 108
    .line 109
    move-result v6

    .line 110
    if-eqz v6, :cond_3

    .line 111
    .line 112
    goto/16 :goto_6

    .line 113
    .line 114
    :cond_3
    invoke-virtual {v1, v7}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    if-eqz v1, :cond_b

    .line 119
    .line 120
    iget-object v1, v0, Lop;->b:Ljava/util/HashMap;

    .line 121
    .line 122
    iget v6, v4, Ljp;->a:I

    .line 123
    .line 124
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 125
    .line 126
    .line 127
    move-result-object v6

    .line 128
    invoke-virtual {v1, v6, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-object v4, v3

    .line 132
    goto/16 :goto_3

    .line 133
    .line 134
    :catch_0
    move-exception p1

    .line 135
    goto/16 :goto_4

    .line 136
    .line 137
    :catch_1
    move-exception p1

    .line 138
    goto/16 :goto_5

    .line 139
    .line 140
    :cond_4
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v1

    .line 144
    invoke-virtual {v1}, Ljava/lang/String;->hashCode()I

    .line 145
    .line 146
    .line 147
    move-result v6
    :try_end_1
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 148
    const-string v8, "XML parser error must be within a Constraint "

    .line 149
    .line 150
    sparse-switch v6, :sswitch_data_0

    .line 151
    .line 152
    .line 153
    goto/16 :goto_3

    .line 154
    .line 155
    :sswitch_0
    :try_start_2
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v1

    .line 159
    if-eqz v1, :cond_b

    .line 160
    .line 161
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 162
    .line 163
    .line 164
    move-result-object v1

    .line 165
    invoke-static {p1, v1}, Lop;->c(Landroid/content/Context;Landroid/util/AttributeSet;)Ljp;

    .line 166
    .line 167
    .line 168
    move-result-object v4

    .line 169
    goto/16 :goto_3

    .line 170
    .line 171
    :sswitch_1
    const-string v6, "CustomAttribute"

    .line 172
    .line 173
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 174
    .line 175
    .line 176
    move-result v1

    .line 177
    if-eqz v1, :cond_b

    .line 178
    .line 179
    if-eqz v4, :cond_5

    .line 180
    .line 181
    iget-object v1, v4, Ljp;->f:Ljava/util/HashMap;

    .line 182
    .line 183
    invoke-static {p1, p2, v1}, Lcp;->a(Landroid/content/Context;Landroid/content/res/XmlResourceParser;Ljava/util/HashMap;)V

    .line 184
    .line 185
    .line 186
    goto/16 :goto_3

    .line 187
    .line 188
    :cond_5
    new-instance p1, Ljava/lang/RuntimeException;

    .line 189
    .line 190
    new-instance v1, Ljava/lang/StringBuilder;

    .line 191
    .line 192
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getLineNumber()I

    .line 199
    .line 200
    .line 201
    move-result p2

    .line 202
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 203
    .line 204
    .line 205
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p2

    .line 209
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    throw p1

    .line 213
    :sswitch_2
    const-string v6, "Barrier"

    .line 214
    .line 215
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    if-eqz v1, :cond_b

    .line 220
    .line 221
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    invoke-static {p1, v1}, Lop;->c(Landroid/content/Context;Landroid/util/AttributeSet;)Ljp;

    .line 226
    .line 227
    .line 228
    move-result-object v4

    .line 229
    iget-object v1, v4, Ljp;->d:Lkp;

    .line 230
    .line 231
    iput v5, v1, Lkp;->c0:I

    .line 232
    .line 233
    goto/16 :goto_3

    .line 234
    .line 235
    :sswitch_3
    const-string v6, "Guideline"

    .line 236
    .line 237
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    if-eqz v1, :cond_b

    .line 242
    .line 243
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-static {p1, v1}, Lop;->c(Landroid/content/Context;Landroid/util/AttributeSet;)Ljp;

    .line 248
    .line 249
    .line 250
    move-result-object v4

    .line 251
    iget-object v1, v4, Ljp;->d:Lkp;

    .line 252
    .line 253
    iput-boolean v5, v1, Lkp;->a:Z

    .line 254
    .line 255
    goto/16 :goto_3

    .line 256
    .line 257
    :sswitch_4
    const-string v6, "Transform"

    .line 258
    .line 259
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    if-eqz v1, :cond_b

    .line 264
    .line 265
    if-eqz v4, :cond_6

    .line 266
    .line 267
    iget-object v1, v4, Ljp;->e:Lnp;

    .line 268
    .line 269
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 270
    .line 271
    .line 272
    move-result-object v6

    .line 273
    invoke-virtual {v1, p1, v6}, Lnp;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 274
    .line 275
    .line 276
    goto/16 :goto_3

    .line 277
    .line 278
    :cond_6
    new-instance p1, Ljava/lang/RuntimeException;

    .line 279
    .line 280
    new-instance v1, Ljava/lang/StringBuilder;

    .line 281
    .line 282
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 283
    .line 284
    .line 285
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getLineNumber()I

    .line 289
    .line 290
    .line 291
    move-result p2

    .line 292
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 293
    .line 294
    .line 295
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object p2

    .line 299
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    throw p1

    .line 303
    :sswitch_5
    const-string v6, "PropertySet"

    .line 304
    .line 305
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    move-result v1

    .line 309
    if-eqz v1, :cond_b

    .line 310
    .line 311
    if-eqz v4, :cond_7

    .line 312
    .line 313
    iget-object v1, v4, Ljp;->b:Lmp;

    .line 314
    .line 315
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 316
    .line 317
    .line 318
    move-result-object v6

    .line 319
    invoke-virtual {v1, p1, v6}, Lmp;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 320
    .line 321
    .line 322
    goto/16 :goto_3

    .line 323
    .line 324
    :cond_7
    new-instance p1, Ljava/lang/RuntimeException;

    .line 325
    .line 326
    new-instance v1, Ljava/lang/StringBuilder;

    .line 327
    .line 328
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 329
    .line 330
    .line 331
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 332
    .line 333
    .line 334
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getLineNumber()I

    .line 335
    .line 336
    .line 337
    move-result p2

    .line 338
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 339
    .line 340
    .line 341
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 342
    .line 343
    .line 344
    move-result-object p2

    .line 345
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    throw p1

    .line 349
    :sswitch_6
    const-string v6, "Motion"

    .line 350
    .line 351
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 352
    .line 353
    .line 354
    move-result v1

    .line 355
    if-eqz v1, :cond_b

    .line 356
    .line 357
    if-eqz v4, :cond_8

    .line 358
    .line 359
    iget-object v1, v4, Ljp;->c:Llp;

    .line 360
    .line 361
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 362
    .line 363
    .line 364
    move-result-object v6

    .line 365
    invoke-virtual {v1, p1, v6}, Llp;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 366
    .line 367
    .line 368
    goto :goto_3

    .line 369
    :cond_8
    new-instance p1, Ljava/lang/RuntimeException;

    .line 370
    .line 371
    new-instance v1, Ljava/lang/StringBuilder;

    .line 372
    .line 373
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 374
    .line 375
    .line 376
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 377
    .line 378
    .line 379
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getLineNumber()I

    .line 380
    .line 381
    .line 382
    move-result p2

    .line 383
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 384
    .line 385
    .line 386
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object p2

    .line 390
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    throw p1

    .line 394
    :sswitch_7
    const-string v6, "Layout"

    .line 395
    .line 396
    invoke-virtual {v1, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 397
    .line 398
    .line 399
    move-result v1

    .line 400
    if-eqz v1, :cond_b

    .line 401
    .line 402
    if-eqz v4, :cond_9

    .line 403
    .line 404
    iget-object v1, v4, Ljp;->d:Lkp;

    .line 405
    .line 406
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 407
    .line 408
    .line 409
    move-result-object v6

    .line 410
    invoke-virtual {v1, p1, v6}, Lkp;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 411
    .line 412
    .line 413
    goto :goto_3

    .line 414
    :cond_9
    new-instance p1, Ljava/lang/RuntimeException;

    .line 415
    .line 416
    new-instance v1, Ljava/lang/StringBuilder;

    .line 417
    .line 418
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 419
    .line 420
    .line 421
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 422
    .line 423
    .line 424
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getLineNumber()I

    .line 425
    .line 426
    .line 427
    move-result p2

    .line 428
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 429
    .line 430
    .line 431
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object p2

    .line 435
    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 436
    .line 437
    .line 438
    throw p1

    .line 439
    :cond_a
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 440
    .line 441
    .line 442
    :cond_b
    :goto_3
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 443
    .line 444
    .line 445
    move-result v1
    :try_end_2
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 446
    goto/16 :goto_2

    .line 447
    .line 448
    :goto_4
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 449
    .line 450
    .line 451
    goto :goto_6

    .line 452
    :goto_5
    invoke-virtual {p1}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    .line 453
    .line 454
    .line 455
    :cond_c
    :goto_6
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 456
    .line 457
    check-cast p0, Landroid/util/SparseArray;

    .line 458
    .line 459
    invoke-virtual {p0, v2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 460
    .line 461
    .line 462
    return-void

    .line 463
    :cond_d
    add-int/lit8 v2, v2, 0x1

    .line 464
    .line 465
    goto/16 :goto_0

    .line 466
    .line 467
    :cond_e
    return-void

    .line 468
    nop

    .line 469
    :sswitch_data_0
    .sparse-switch
        -0x78c018b6 -> :sswitch_7
        -0x7648542a -> :sswitch_6
        -0x4bab3dd3 -> :sswitch_5
        -0x49cf74b4 -> :sswitch_4
        -0x446d330 -> :sswitch_3
        0x4f5d3b97 -> :sswitch_2
        0x6acd460b -> :sswitch_1
        0x6b78f1fd -> :sswitch_0
    .end sparse-switch
.end method

.method public G()V
    .locals 1

    .line 1
    :try_start_0
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ljava/nio/channels/FileLock;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/nio/channels/FileLock;->release()V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast p0, Ljava/nio/channels/FileChannel;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/nio/channels/spi/AbstractInterruptibleChannel;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :catch_0
    return-void
.end method

.method public H(Z)V
    .locals 4

    .line 1
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lbv1;

    .line 4
    .line 5
    iget-object p0, p0, Lbv1;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ls7;

    .line 8
    .line 9
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast p0, Lo00;

    .line 12
    .line 13
    iget-boolean v0, p0, Lo00;->l:Z

    .line 14
    .line 15
    if-eq v0, p1, :cond_1

    .line 16
    .line 17
    iget-object v0, p0, Lo00;->k:Ln00;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-static {}, Lzz;->a()Lzz;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iget-object v1, p0, Lo00;->k:Ln00;

    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    .line 29
    .line 30
    const-string v2, "initCallback cannot be null"

    .line 31
    .line 32
    invoke-static {v1, v2}, Lqe0;->b(Ljava/lang/Object;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    iget-object v2, v0, Lzz;->a:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-interface {v3}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 42
    .line 43
    .line 44
    :try_start_0
    iget-object v0, v0, Lzz;->b:Lha;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Lha;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 63
    .line 64
    .line 65
    throw p0

    .line 66
    :cond_0
    :goto_0
    iput-boolean p1, p0, Lo00;->l:Z

    .line 67
    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    iget-object p0, p0, Lo00;->j:Landroid/widget/EditText;

    .line 71
    .line 72
    invoke-static {}, Lzz;->a()Lzz;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    invoke-virtual {p1}, Lzz;->b()I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    invoke-static {p0, p1}, Lo00;->a(Landroid/widget/EditText;I)V

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void
.end method

.method public I(IIII)V
    .locals 2

    .line 1
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroidx/cardview/widget/CardView;

    .line 4
    .line 5
    iget-object v0, p0, Landroidx/cardview/widget/CardView;->m:Landroid/graphics/Rect;

    .line 6
    .line 7
    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Landroidx/cardview/widget/CardView;->l:Landroid/graphics/Rect;

    .line 11
    .line 12
    iget v1, v0, Landroid/graphics/Rect;->left:I

    .line 13
    .line 14
    add-int/2addr p1, v1

    .line 15
    iget v1, v0, Landroid/graphics/Rect;->top:I

    .line 16
    .line 17
    add-int/2addr p2, v1

    .line 18
    iget v1, v0, Landroid/graphics/Rect;->right:I

    .line 19
    .line 20
    add-int/2addr p3, v1

    .line 21
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 22
    .line 23
    add-int/2addr p4, v0

    .line 24
    invoke-static {p0, p1, p2, p3, p4}, Landroidx/cardview/widget/CardView;->a(Landroidx/cardview/widget/CardView;IIII)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public J(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;
    .locals 7

    .line 1
    instance-of v0, p1, Landroid/graphics/drawable/LayerDrawable;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    check-cast p1, Landroid/graphics/drawable/LayerDrawable;

    .line 7
    .line 8
    invoke-virtual {p1}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    new-array v0, p2, [Landroid/graphics/drawable/Drawable;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    move v3, v2

    .line 16
    :goto_0
    if-ge v3, p2, :cond_2

    .line 17
    .line 18
    invoke-virtual {p1, v3}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    invoke-virtual {p1, v3}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    const v6, 0x102000d

    .line 27
    .line 28
    .line 29
    if-eq v4, v6, :cond_1

    .line 30
    .line 31
    const v6, 0x102000f

    .line 32
    .line 33
    .line 34
    if-ne v4, v6, :cond_0

    .line 35
    .line 36
    goto :goto_1

    .line 37
    :cond_0
    move v4, v2

    .line 38
    goto :goto_2

    .line 39
    :cond_1
    :goto_1
    move v4, v1

    .line 40
    :goto_2
    invoke-virtual {p0, v5, v4}, Ls7;->J(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    aput-object v4, v0, v3

    .line 45
    .line 46
    add-int/lit8 v3, v3, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    new-instance p0, Landroid/graphics/drawable/LayerDrawable;

    .line 50
    .line 51
    invoke-direct {p0, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    .line 52
    .line 53
    .line 54
    :goto_3
    if-ge v2, p2, :cond_3

    .line 55
    .line 56
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getId(I)I

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setId(II)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerGravity(I)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerGravity(II)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerWidth(I)I

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerWidth(II)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerHeight(I)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerHeight(II)V

    .line 82
    .line 83
    .line 84
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerInsetLeft(I)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetLeft(II)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerInsetRight(I)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetRight(II)V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerInsetTop(I)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetTop(II)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerInsetBottom(I)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetBottom(II)V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerInsetStart(I)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetStart(II)V

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, v2}, Landroid/graphics/drawable/LayerDrawable;->getLayerInsetEnd(I)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    invoke-virtual {p0, v2, v0}, Landroid/graphics/drawable/LayerDrawable;->setLayerInsetEnd(II)V

    .line 124
    .line 125
    .line 126
    add-int/lit8 v2, v2, 0x1

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_3
    return-object p0

    .line 130
    :cond_4
    instance-of v0, p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 131
    .line 132
    if-eqz v0, :cond_7

    .line 133
    .line 134
    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    .line 135
    .line 136
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 137
    .line 138
    .line 139
    move-result-object v0

    .line 140
    iget-object v2, p0, Ls7;->l:Ljava/lang/Object;

    .line 141
    .line 142
    check-cast v2, Landroid/graphics/Bitmap;

    .line 143
    .line 144
    if-nez v2, :cond_5

    .line 145
    .line 146
    iput-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 147
    .line 148
    :cond_5
    new-instance p0, Landroid/graphics/drawable/ShapeDrawable;

    .line 149
    .line 150
    const/16 v2, 0x8

    .line 151
    .line 152
    new-array v2, v2, [F

    .line 153
    .line 154
    fill-array-data v2, :array_0

    .line 155
    .line 156
    .line 157
    new-instance v3, Landroid/graphics/drawable/shapes/RoundRectShape;

    .line 158
    .line 159
    const/4 v4, 0x0

    .line 160
    invoke-direct {v3, v2, v4, v4}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    .line 161
    .line 162
    .line 163
    invoke-direct {p0, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    .line 164
    .line 165
    .line 166
    new-instance v2, Landroid/graphics/BitmapShader;

    .line 167
    .line 168
    sget-object v3, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 169
    .line 170
    sget-object v4, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 171
    .line 172
    invoke-direct {v2, v0, v3, v4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 173
    .line 174
    .line 175
    invoke-virtual {p0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 180
    .line 181
    .line 182
    invoke-virtual {p0}, Landroid/graphics/drawable/ShapeDrawable;->getPaint()Landroid/graphics/Paint;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getPaint()Landroid/graphics/Paint;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    invoke-virtual {p1}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 195
    .line 196
    .line 197
    if-eqz p2, :cond_6

    .line 198
    .line 199
    new-instance p1, Landroid/graphics/drawable/ClipDrawable;

    .line 200
    .line 201
    const/4 p2, 0x3

    .line 202
    invoke-direct {p1, p0, p2, v1}, Landroid/graphics/drawable/ClipDrawable;-><init>(Landroid/graphics/drawable/Drawable;II)V

    .line 203
    .line 204
    .line 205
    return-object p1

    .line 206
    :cond_6
    return-object p0

    .line 207
    :cond_7
    return-object p1

    .line 208
    nop

    .line 209
    :array_0
    .array-data 4
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
        0x40a00000    # 5.0f
    .end array-data
.end method

.method public K()V
    .locals 5

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lam;

    .line 4
    .line 5
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast p0, Ljava/lang/String;

    .line 8
    .line 9
    iget-object v1, v0, Lam;->g:Landroid/os/Bundle;

    .line 10
    .line 11
    iget-object v2, v0, Lam;->f:Ljava/util/HashMap;

    .line 12
    .line 13
    iget-object v3, v0, Lam;->d:Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-virtual {v3, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v3

    .line 19
    if-nez v3, :cond_0

    .line 20
    .line 21
    iget-object v3, v0, Lam;->b:Ljava/util/HashMap;

    .line 22
    .line 23
    invoke-virtual {v3, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Ljava/lang/Integer;

    .line 28
    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    iget-object v4, v0, Lam;->a:Ljava/util/HashMap;

    .line 32
    .line 33
    invoke-virtual {v4, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    :cond_0
    iget-object v3, v0, Lam;->e:Ljava/util/HashMap;

    .line 37
    .line 38
    invoke-virtual {v3, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    invoke-virtual {v2, p0}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    if-eqz v3, :cond_1

    .line 46
    .line 47
    invoke-virtual {v2, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v3

    .line 51
    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v2, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    :cond_1
    invoke-virtual {v1, p0}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v2

    .line 61
    if-eqz v2, :cond_2

    .line 62
    .line 63
    invoke-virtual {v1, p0}, Landroid/os/Bundle;->getParcelable(Ljava/lang/String;)Landroid/os/Parcelable;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v1, p0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_2
    iget-object v0, v0, Lam;->c:Ljava/util/HashMap;

    .line 74
    .line 75
    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    if-nez p0, :cond_3

    .line 80
    .line 81
    return-void

    .line 82
    :cond_3
    invoke-static {}, Lz0;->a()V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public a()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Lif1;

    .line 4
    .line 5
    return-object p0
.end method

.method public b(Ljava/lang/CharSequence;IILme1;)Z
    .locals 3

    .line 1
    iget v0, p4, Lme1;->c:I

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x4

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-lez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget-object v0, p0, Ls7;->k:Ljava/lang/Object;

    .line 10
    .line 11
    check-cast v0, Lif1;

    .line 12
    .line 13
    if-nez v0, :cond_2

    .line 14
    .line 15
    new-instance v0, Lif1;

    .line 16
    .line 17
    instance-of v2, p1, Landroid/text/Spannable;

    .line 18
    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    check-cast p1, Landroid/text/Spannable;

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_1
    new-instance v2, Landroid/text/SpannableString;

    .line 25
    .line 26
    invoke-direct {v2, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 27
    .line 28
    .line 29
    move-object p1, v2

    .line 30
    :goto_0
    invoke-direct {v0, p1}, Lif1;-><init>(Landroid/text/Spannable;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Ls7;->k:Ljava/lang/Object;

    .line 34
    .line 35
    :cond_2
    iget-object p1, p0, Ls7;->l:Ljava/lang/Object;

    .line 36
    .line 37
    check-cast p1, Ltb0;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    .line 41
    .line 42
    new-instance p1, Lne1;

    .line 43
    .line 44
    invoke-direct {p1, p4}, Lne1;-><init>(Lme1;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 48
    .line 49
    check-cast p0, Lif1;

    .line 50
    .line 51
    const/16 p4, 0x21

    .line 52
    .line 53
    invoke-virtual {p0, p1, p2, p3, p4}, Lif1;->setSpan(Ljava/lang/Object;III)V

    .line 54
    .line 55
    .line 56
    return v1
.end method

.method public declared-synchronized e()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ls7;->k:Ljava/lang/Object;

    .line 3
    .line 4
    check-cast v0, Ljava/util/LinkedHashSet;

    .line 5
    .line 6
    invoke-interface {v0}, Ljava/util/Set;->isEmpty()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 13
    .line 14
    check-cast v0, Ljn;

    .line 15
    .line 16
    const-wide/16 v1, 0x0

    .line 17
    .line 18
    invoke-virtual {v0, v1, v2}, Ljn;->e(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw v0
.end method

.method public f(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Ls7;->f(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lo70;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method

.method public g(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v1, v0, Lz70;->t:Lj70;

    .line 6
    .line 7
    iget-object v1, v1, Lj70;->y:Le6;

    .line 8
    .line 9
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Ls7;->g(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lo70;

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    return-void
.end method

.method public h(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Ls7;->h(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lo70;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method

.method public i(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Ls7;->i(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lo70;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method

.method public j(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Ls7;->j(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lo70;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method

.method public k(Lh70;Z)V
    .locals 7

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, p1, v1}, Ls7;->k(Lh70;Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_7

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lo70;

    .line 38
    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 45
    .line 46
    sget-object v1, Lf80;->f:Lg5;

    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const-string v3, "FragmentMonitor %s.onFragmentPaused "

    .line 61
    .line 62
    invoke-virtual {v1, v3, v2}, Lg5;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    iget-object v2, v0, Lf80;->a:Ljava/util/WeakHashMap;

    .line 66
    .line 67
    invoke-virtual {v2, p1}, Ljava/util/WeakHashMap;->containsKey(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-nez v3, :cond_2

    .line 72
    .line 73
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const-string v2, "FragmentMonitor: missed a fragment trace from %s"

    .line 86
    .line 87
    invoke-virtual {v1, v2, v0}, Lg5;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    invoke-virtual {v2, p1}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Lcom/google/firebase/perf/metrics/Trace;

    .line 96
    .line 97
    invoke-virtual {v2, p1}, Ljava/util/WeakHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    iget-object v0, v0, Lf80;->e:Ln80;

    .line 101
    .line 102
    iget-object v2, v0, Ln80;->c:Ljava/util/HashMap;

    .line 103
    .line 104
    sget-object v4, Ln80;->e:Lg5;

    .line 105
    .line 106
    iget-boolean v5, v0, Ln80;->d:Z

    .line 107
    .line 108
    if-nez v5, :cond_3

    .line 109
    .line 110
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    .line 112
    .line 113
    new-instance v0, Lgs0;

    .line 114
    .line 115
    invoke-direct {v0}, Lgs0;-><init>()V

    .line 116
    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_3
    invoke-virtual {v2, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    move-result v5

    .line 123
    if-nez v5, :cond_4

    .line 124
    .line 125
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    const-string v2, "Sub-recording associated with key %s was not started or does not exist"

    .line 138
    .line 139
    invoke-virtual {v4, v2, v0}, Lg5;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 140
    .line 141
    .line 142
    new-instance v0, Lgs0;

    .line 143
    .line 144
    invoke-direct {v0}, Lgs0;-><init>()V

    .line 145
    .line 146
    .line 147
    goto :goto_1

    .line 148
    :cond_4
    invoke-virtual {v2, p1}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    check-cast v2, Lm80;

    .line 153
    .line 154
    invoke-virtual {v0}, Ln80;->a()Lgs0;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {v0}, Lgs0;->b()Z

    .line 159
    .line 160
    .line 161
    move-result v5

    .line 162
    if-nez v5, :cond_5

    .line 163
    .line 164
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 165
    .line 166
    .line 167
    move-result-object v0

    .line 168
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    const-string v2, "stopFragment(%s): snapshot() failed"

    .line 177
    .line 178
    invoke-virtual {v4, v2, v0}, Lg5;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 179
    .line 180
    .line 181
    new-instance v0, Lgs0;

    .line 182
    .line 183
    invoke-direct {v0}, Lgs0;-><init>()V

    .line 184
    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_5
    invoke-virtual {v0}, Lgs0;->a()Ljava/lang/Object;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    check-cast v0, Lm80;

    .line 192
    .line 193
    iget v4, v0, Lm80;->a:I

    .line 194
    .line 195
    iget v5, v2, Lm80;->a:I

    .line 196
    .line 197
    sub-int/2addr v4, v5

    .line 198
    iget v5, v0, Lm80;->b:I

    .line 199
    .line 200
    iget v6, v2, Lm80;->b:I

    .line 201
    .line 202
    sub-int/2addr v5, v6

    .line 203
    iget v0, v0, Lm80;->c:I

    .line 204
    .line 205
    iget v2, v2, Lm80;->c:I

    .line 206
    .line 207
    sub-int/2addr v0, v2

    .line 208
    new-instance v2, Lm80;

    .line 209
    .line 210
    invoke-direct {v2, v4, v5, v0}, Lm80;-><init>(III)V

    .line 211
    .line 212
    .line 213
    new-instance v0, Lgs0;

    .line 214
    .line 215
    invoke-direct {v0, v2}, Lgs0;-><init>(Ljava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    :goto_1
    invoke-virtual {v0}, Lgs0;->b()Z

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    if-nez v2, :cond_6

    .line 223
    .line 224
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object v0

    .line 232
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    const-string v2, "onFragmentPaused: recorder failed to trace %s"

    .line 237
    .line 238
    invoke-virtual {v1, v2, v0}, Lg5;->e(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 239
    .line 240
    .line 241
    goto/16 :goto_0

    .line 242
    .line 243
    :cond_6
    invoke-virtual {v0}, Lgs0;->a()Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    check-cast v0, Lm80;

    .line 248
    .line 249
    invoke-static {v3, v0}, Li31;->a(Lcom/google/firebase/perf/metrics/Trace;Lm80;)V

    .line 250
    .line 251
    .line 252
    invoke-virtual {v3}, Lcom/google/firebase/perf/metrics/Trace;->stop()V

    .line 253
    .line 254
    .line 255
    goto/16 :goto_0

    .line 256
    .line 257
    :cond_7
    return-void
.end method

.method public l(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v1, v0, Lz70;->t:Lj70;

    .line 6
    .line 7
    iget-object v1, v1, Lj70;->y:Le6;

    .line 8
    .line 9
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 18
    .line 19
    const/4 v1, 0x1

    .line 20
    invoke-virtual {v0, v1}, Ls7;->l(Z)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 24
    .line 25
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 26
    .line 27
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-eqz v0, :cond_2

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Lo70;

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    .line 47
    .line 48
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    return-void
.end method

.method public m(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Ls7;->m(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lo70;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method

.method public n(Lh70;Z)V
    .locals 6

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, p1, v1}, Ls7;->n(Lh70;Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_7

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lo70;

    .line 38
    .line 39
    if-eqz p2, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 45
    .line 46
    sget-object v1, Lf80;->f:Lg5;

    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    const-string v3, "FragmentMonitor %s.onFragmentResumed"

    .line 61
    .line 62
    invoke-virtual {v1, v3, v2}, Lg5;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    new-instance v1, Lcom/google/firebase/perf/metrics/Trace;

    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    const-string v3, "_st_"

    .line 76
    .line 77
    invoke-virtual {v3, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    iget-object v3, v0, Lf80;->c:Lvd1;

    .line 82
    .line 83
    iget-object v4, v0, Lf80;->b:Lmz;

    .line 84
    .line 85
    iget-object v5, v0, Lf80;->d:Lr9;

    .line 86
    .line 87
    invoke-direct {v1, v2, v3, v4, v5}, Lcom/google/firebase/perf/metrics/Trace;-><init>(Ljava/lang/String;Lvd1;Lmz;Lr9;)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/google/firebase/perf/metrics/Trace;->start()V

    .line 91
    .line 92
    .line 93
    iget-object v2, p1, Lh70;->D:Lh70;

    .line 94
    .line 95
    if-nez v2, :cond_2

    .line 96
    .line 97
    const-string v2, "No parent"

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_2
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 101
    .line 102
    .line 103
    move-result-object v2

    .line 104
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    :goto_1
    const-string v3, "Parent_fragment"

    .line 109
    .line 110
    invoke-virtual {v1, v3, v2}, Lcom/google/firebase/perf/metrics/Trace;->putAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p1}, Lh70;->g()Le6;

    .line 114
    .line 115
    .line 116
    move-result-object v2

    .line 117
    if-eqz v2, :cond_3

    .line 118
    .line 119
    invoke-virtual {p1}, Lh70;->g()Le6;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v2

    .line 131
    const-string v3, "Hosting_activity"

    .line 132
    .line 133
    invoke-virtual {v1, v3, v2}, Lcom/google/firebase/perf/metrics/Trace;->putAttribute(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_3
    iget-object v2, v0, Lf80;->a:Ljava/util/WeakHashMap;

    .line 137
    .line 138
    invoke-virtual {v2, p1, v1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    iget-object v0, v0, Lf80;->e:Ln80;

    .line 142
    .line 143
    iget-object v1, v0, Ln80;->c:Ljava/util/HashMap;

    .line 144
    .line 145
    sget-object v2, Ln80;->e:Lg5;

    .line 146
    .line 147
    iget-boolean v3, v0, Ln80;->d:Z

    .line 148
    .line 149
    if-nez v3, :cond_4

    .line 150
    .line 151
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 152
    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_4
    invoke-virtual {v1, p1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v3

    .line 159
    if-eqz v3, :cond_5

    .line 160
    .line 161
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    const-string v1, "Cannot start sub-recording because one is already ongoing with the key %s"

    .line 174
    .line 175
    invoke-virtual {v2, v1, v0}, Lg5;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 176
    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_5
    invoke-virtual {v0}, Ln80;->a()Lgs0;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    invoke-virtual {v0}, Lgs0;->b()Z

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    if-nez v3, :cond_6

    .line 189
    .line 190
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 191
    .line 192
    .line 193
    move-result-object v0

    .line 194
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    const-string v1, "startFragment(%s): snapshot() failed"

    .line 203
    .line 204
    invoke-virtual {v2, v1, v0}, Lg5;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 205
    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :cond_6
    invoke-virtual {v0}, Lgs0;->a()Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    check-cast v0, Lm80;

    .line 214
    .line 215
    invoke-virtual {v1, p1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :cond_7
    return-void
.end method

.method public o(Ljava/lang/Object;)Ljd2;
    .locals 3

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ls7;->l:Ljava/lang/Object;

    .line 8
    .line 9
    check-cast v1, Lor;

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object p0, v1, Lor;->g:Lm30;

    .line 15
    .line 16
    sget-object p1, Lor;->r:Ly1;

    .line 17
    .line 18
    iget-object p0, p0, Lm30;->l:Ljava/lang/Object;

    .line 19
    .line 20
    check-cast p0, Ljava/io/File;

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Ljava/io/File;->listFiles(Ljava/io/FilenameFilter;)[Ljava/io/File;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0}, Lm30;->e([Ljava/lang/Object;)Ljava/util/List;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Ljava/io/File;

    .line 45
    .line 46
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object p0, v1, Lor;->m:Li7;

    .line 51
    .line 52
    iget-object p0, p0, Li7;->k:Ljava/lang/Object;

    .line 53
    .line 54
    check-cast p0, Lxs;

    .line 55
    .line 56
    iget-object p0, p0, Lxs;->b:Lm30;

    .line 57
    .line 58
    iget-object p1, p0, Lm30;->n:Ljava/lang/Object;

    .line 59
    .line 60
    check-cast p1, Ljava/io/File;

    .line 61
    .line 62
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    invoke-static {p1}, Lm30;->e([Ljava/lang/Object;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {p1}, Lxs;->a(Ljava/util/List;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lm30;->o:Ljava/lang/Object;

    .line 74
    .line 75
    check-cast p1, Ljava/io/File;

    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-static {p1}, Lm30;->e([Ljava/lang/Object;)Ljava/util/List;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-static {p1}, Lxs;->a(Ljava/util/List;)V

    .line 86
    .line 87
    .line 88
    iget-object p0, p0, Lm30;->p:Ljava/lang/Object;

    .line 89
    .line 90
    check-cast p0, Ljava/io/File;

    .line 91
    .line 92
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {p0}, Lm30;->e([Ljava/lang/Object;)Ljava/util/List;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {p0}, Lxs;->a(Ljava/util/List;)V

    .line 101
    .line 102
    .line 103
    iget-object p0, v1, Lor;->q:Llb1;

    .line 104
    .line 105
    invoke-virtual {p0, v2}, Llb1;->b(Ljava/lang/Object;)V

    .line 106
    .line 107
    .line 108
    invoke-static {v2}, Lbe2;->l(Ljava/lang/Object;)Ljd2;

    .line 109
    .line 110
    .line 111
    move-result-object p0

    .line 112
    return-object p0

    .line 113
    :cond_1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 114
    .line 115
    .line 116
    move-result p1

    .line 117
    iget-object v0, v1, Lor;->b:Lqt;

    .line 118
    .line 119
    if-eqz p1, :cond_2

    .line 120
    .line 121
    iget-object p1, v0, Lqt;->f:Ljava/lang/Object;

    .line 122
    .line 123
    check-cast p1, Llb1;

    .line 124
    .line 125
    invoke-virtual {p1, v2}, Llb1;->b(Ljava/lang/Object;)V

    .line 126
    .line 127
    .line 128
    iget-object p1, p0, Ls7;->k:Ljava/lang/Object;

    .line 129
    .line 130
    check-cast p1, Ljd2;

    .line 131
    .line 132
    iget-object v0, v1, Lor;->e:Lc9;

    .line 133
    .line 134
    iget-object v0, v0, Lc9;->k:Ljava/lang/Object;

    .line 135
    .line 136
    check-cast v0, Lzs;

    .line 137
    .line 138
    new-instance v1, Lpa0;

    .line 139
    .line 140
    const/16 v2, 0xc

    .line 141
    .line 142
    invoke-direct {v1, v2, p0}, Lpa0;-><init>(ILjava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1, v0, v1}, Ljd2;->k(Ljava/util/concurrent/Executor;Lpa1;)Ljd2;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    return-object p0

    .line 150
    :cond_2
    const-string p0, "An invalid data collection token was used."

    .line 151
    .line 152
    invoke-static {p0}, Lz0;->g(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    return-object v2
.end method

.method public onCancel()V
    .locals 1

    .line 1
    iget-object v0, p0, Ls7;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Landroid/animation/Animator;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/animation/Animator;->end()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x2

    .line 9
    invoke-static {v0}, Lz70;->F(I)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 16
    .line 17
    check-cast p0, Lw81;

    .line 18
    .line 19
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public p(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Ls7;->p(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lo70;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method

.method public q(Ls50;Lkq;)Ljava/lang/Object;
    .locals 10

    .line 1
    iget v0, p0, Ls7;->j:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    const-string v2, "call to \'resume\' before \'invoke\' with coroutine"

    .line 5
    .line 6
    const/high16 v3, -0x80000000

    .line 7
    .line 8
    const/4 v4, 0x1

    .line 9
    sget-object v5, Lwe1;->a:Lwe1;

    .line 10
    .line 11
    sget-object v6, Lar;->j:Lar;

    .line 12
    .line 13
    const/4 v7, 0x0

    .line 14
    packed-switch v0, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    instance-of v0, p2, Le60;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    move-object v0, p2

    .line 22
    check-cast v0, Le60;

    .line 23
    .line 24
    iget v1, v0, Le60;->n:I

    .line 25
    .line 26
    and-int v8, v1, v3

    .line 27
    .line 28
    if-eqz v8, :cond_0

    .line 29
    .line 30
    sub-int/2addr v1, v3

    .line 31
    iput v1, v0, Le60;->n:I

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    new-instance v0, Le60;

    .line 35
    .line 36
    invoke-direct {v0, p0, p2}, Le60;-><init>(Ls7;Lkq;)V

    .line 37
    .line 38
    .line 39
    :goto_0
    iget-object p2, v0, Le60;->m:Ljava/lang/Object;

    .line 40
    .line 41
    iget v1, v0, Le60;->n:I

    .line 42
    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    if-ne v1, v4, :cond_1

    .line 46
    .line 47
    iget-object p0, v0, Le60;->p:Lb60;

    .line 48
    .line 49
    :try_start_0
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_0
    .catch Lc; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    goto :goto_2

    .line 53
    :catch_0
    move-exception p1

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    invoke-static {v2}, Lz0;->g(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    move-object v5, v7

    .line 59
    goto :goto_2

    .line 60
    :cond_2
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    iget-object p2, p0, Ls7;->k:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast p2, Ls7;

    .line 66
    .line 67
    new-instance v1, Lb60;

    .line 68
    .line 69
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 70
    .line 71
    check-cast p0, Lfu;

    .line 72
    .line 73
    invoke-direct {v1, p0, p1}, Lb60;-><init>(Lfu;Ls50;)V

    .line 74
    .line 75
    .line 76
    :try_start_1
    iput-object v1, v0, Le60;->p:Lb60;

    .line 77
    .line 78
    iput v4, v0, Le60;->n:I

    .line 79
    .line 80
    invoke-virtual {p2, v1, v0}, Ls7;->q(Ls50;Lkq;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    move-result-object p0
    :try_end_1
    .catch Lc; {:try_start_1 .. :try_end_1} :catch_1

    .line 84
    if-ne p0, v6, :cond_3

    .line 85
    .line 86
    move-object v5, v6

    .line 87
    goto :goto_2

    .line 88
    :catch_1
    move-exception p1

    .line 89
    move-object p0, v1

    .line 90
    :goto_1
    iget-object p2, p1, Lc;->j:Ljava/lang/Object;

    .line 91
    .line 92
    if-ne p2, p0, :cond_4

    .line 93
    .line 94
    :cond_3
    :goto_2
    return-object v5

    .line 95
    :cond_4
    throw p1

    .line 96
    :pswitch_0
    new-instance v0, Lez0;

    .line 97
    .line 98
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 99
    .line 100
    .line 101
    iget-object v1, p0, Ls7;->k:Ljava/lang/Object;

    .line 102
    .line 103
    check-cast v1, Ls7;

    .line 104
    .line 105
    new-instance v2, Ld60;

    .line 106
    .line 107
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 108
    .line 109
    check-cast p0, Lgu;

    .line 110
    .line 111
    invoke-direct {v2, v0, p1, p0}, Ld60;-><init>(Lez0;Ls50;Lgu;)V

    .line 112
    .line 113
    .line 114
    invoke-virtual {v1, v2, p2}, Ls7;->q(Ls50;Lkq;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    if-ne p0, v6, :cond_5

    .line 119
    .line 120
    move-object v5, p0

    .line 121
    :cond_5
    return-object v5

    .line 122
    :pswitch_1
    instance-of v0, p2, Ly50;

    .line 123
    .line 124
    if-eqz v0, :cond_6

    .line 125
    .line 126
    move-object v0, p2

    .line 127
    check-cast v0, Ly50;

    .line 128
    .line 129
    iget v8, v0, Ly50;->n:I

    .line 130
    .line 131
    and-int v9, v8, v3

    .line 132
    .line 133
    if-eqz v9, :cond_6

    .line 134
    .line 135
    sub-int/2addr v8, v3

    .line 136
    iput v8, v0, Ly50;->n:I

    .line 137
    .line 138
    goto :goto_3

    .line 139
    :cond_6
    new-instance v0, Ly50;

    .line 140
    .line 141
    invoke-direct {v0, p0, p2}, Ly50;-><init>(Ls7;Lkq;)V

    .line 142
    .line 143
    .line 144
    :goto_3
    iget-object p2, v0, Ly50;->m:Ljava/lang/Object;

    .line 145
    .line 146
    iget v3, v0, Ly50;->n:I

    .line 147
    .line 148
    if-eqz v3, :cond_9

    .line 149
    .line 150
    if-eq v3, v4, :cond_8

    .line 151
    .line 152
    if-ne v3, v1, :cond_7

    .line 153
    .line 154
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 155
    .line 156
    .line 157
    goto :goto_6

    .line 158
    :cond_7
    invoke-static {v2}, Lz0;->g(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    move-object v5, v7

    .line 162
    goto :goto_6

    .line 163
    :cond_8
    iget-object p1, v0, Ly50;->q:Ls50;

    .line 164
    .line 165
    iget-object p0, v0, Ly50;->p:Ls7;

    .line 166
    .line 167
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 168
    .line 169
    .line 170
    goto :goto_4

    .line 171
    :cond_9
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 172
    .line 173
    .line 174
    iget-object p2, p0, Ls7;->k:Ljava/lang/Object;

    .line 175
    .line 176
    check-cast p2, Lr50;

    .line 177
    .line 178
    iput-object p0, v0, Ly50;->p:Ls7;

    .line 179
    .line 180
    iput-object p1, v0, Ly50;->q:Ls50;

    .line 181
    .line 182
    iput v4, v0, Ly50;->n:I

    .line 183
    .line 184
    invoke-static {p2, p1, v0}, Lfe1;->f(Lr50;Ls50;Lkq;)Ljava/io/Serializable;

    .line 185
    .line 186
    .line 187
    move-result-object p2

    .line 188
    if-ne p2, v6, :cond_a

    .line 189
    .line 190
    goto :goto_5

    .line 191
    :cond_a
    :goto_4
    check-cast p2, Ljava/lang/Throwable;

    .line 192
    .line 193
    if-eqz p2, :cond_b

    .line 194
    .line 195
    iget-object p0, p0, Ls7;->l:Ljava/lang/Object;

    .line 196
    .line 197
    check-cast p0, Ll71;

    .line 198
    .line 199
    iput-object v7, v0, Ly50;->p:Ls7;

    .line 200
    .line 201
    iput-object v7, v0, Ly50;->q:Ls50;

    .line 202
    .line 203
    iput v1, v0, Ly50;->n:I

    .line 204
    .line 205
    invoke-virtual {p0, p1, p2, v0}, Ll71;->e(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    if-ne p0, v6, :cond_b

    .line 210
    .line 211
    :goto_5
    move-object v5, v6

    .line 212
    :cond_b
    :goto_6
    return-object v5

    .line 213
    :pswitch_2
    instance-of v0, p2, Lx50;

    .line 214
    .line 215
    if-eqz v0, :cond_c

    .line 216
    .line 217
    move-object v0, p2

    .line 218
    check-cast v0, Lx50;

    .line 219
    .line 220
    iget v8, v0, Lx50;->n:I

    .line 221
    .line 222
    and-int v9, v8, v3

    .line 223
    .line 224
    if-eqz v9, :cond_c

    .line 225
    .line 226
    sub-int/2addr v8, v3

    .line 227
    iput v8, v0, Lx50;->n:I

    .line 228
    .line 229
    goto :goto_7

    .line 230
    :cond_c
    new-instance v0, Lx50;

    .line 231
    .line 232
    invoke-direct {v0, p0, p2}, Lx50;-><init>(Ls7;Lkq;)V

    .line 233
    .line 234
    .line 235
    :goto_7
    iget-object p2, v0, Lx50;->m:Ljava/lang/Object;

    .line 236
    .line 237
    iget v3, v0, Lx50;->n:I

    .line 238
    .line 239
    if-eqz v3, :cond_f

    .line 240
    .line 241
    if-eq v3, v4, :cond_e

    .line 242
    .line 243
    if-ne v3, v1, :cond_d

    .line 244
    .line 245
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 246
    .line 247
    .line 248
    goto :goto_a

    .line 249
    :cond_d
    invoke-static {v2}, Lz0;->g(Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    move-object v5, v7

    .line 253
    goto :goto_a

    .line 254
    :cond_e
    iget-object p0, v0, Lx50;->r:Li21;

    .line 255
    .line 256
    iget-object p1, v0, Lx50;->q:Ls50;

    .line 257
    .line 258
    iget-object v2, v0, Lx50;->p:Ls7;

    .line 259
    .line 260
    :try_start_2
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 261
    .line 262
    .line 263
    goto :goto_8

    .line 264
    :catchall_0
    move-exception p1

    .line 265
    goto :goto_c

    .line 266
    :cond_f
    invoke-static {p2}, Lk42;->n(Ljava/lang/Object;)V

    .line 267
    .line 268
    .line 269
    new-instance p2, Li21;

    .line 270
    .line 271
    iget-object v2, v0, Lkq;->k:Lsq;

    .line 272
    .line 273
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 274
    .line 275
    .line 276
    invoke-direct {p2, p1, v2}, Li21;-><init>(Ls50;Lsq;)V

    .line 277
    .line 278
    .line 279
    :try_start_3
    iget-object v2, p0, Ls7;->k:Ljava/lang/Object;

    .line 280
    .line 281
    check-cast v2, Leu;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 282
    .line 283
    :try_start_4
    iput-object p0, v0, Lx50;->p:Ls7;

    .line 284
    .line 285
    iput-object p1, v0, Lx50;->q:Ls50;

    .line 286
    .line 287
    iput-object p2, v0, Lx50;->r:Li21;

    .line 288
    .line 289
    iput v4, v0, Lx50;->n:I

    .line 290
    .line 291
    invoke-virtual {v2, p2, v0}, Leu;->f(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 295
    if-ne v2, v6, :cond_10

    .line 296
    .line 297
    goto :goto_9

    .line 298
    :cond_10
    move-object v2, p0

    .line 299
    move-object p0, p2

    .line 300
    :goto_8
    invoke-virtual {p0}, Lkq;->n()V

    .line 301
    .line 302
    .line 303
    iget-object p0, v2, Ls7;->l:Ljava/lang/Object;

    .line 304
    .line 305
    check-cast p0, Lr50;

    .line 306
    .line 307
    iput-object v7, v0, Lx50;->p:Ls7;

    .line 308
    .line 309
    iput-object v7, v0, Lx50;->q:Ls50;

    .line 310
    .line 311
    iput-object v7, v0, Lx50;->r:Li21;

    .line 312
    .line 313
    iput v1, v0, Lx50;->n:I

    .line 314
    .line 315
    invoke-interface {p0, p1, v0}, Lr50;->q(Ls50;Lkq;)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    if-ne p0, v6, :cond_11

    .line 320
    .line 321
    :goto_9
    move-object v5, v6

    .line 322
    :cond_11
    :goto_a
    return-object v5

    .line 323
    :catchall_1
    move-exception p1

    .line 324
    :goto_b
    move-object p0, p2

    .line 325
    goto :goto_c

    .line 326
    :catchall_2
    move-exception p0

    .line 327
    move-object p1, p0

    .line 328
    goto :goto_b

    .line 329
    :goto_c
    invoke-virtual {p0}, Lkq;->n()V

    .line 330
    .line 331
    .line 332
    throw p1

    .line 333
    :pswitch_data_0
    .packed-switch 0x15
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public r(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Ls7;->r(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lo70;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method

.method public s(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Ls7;->s(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lo70;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method

.method public t(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Ls7;->t(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lo70;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method

.method public u(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Lz70;

    .line 4
    .line 5
    iget-object v0, v0, Lz70;->v:Lh70;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lh70;->k()Lz70;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v0, v0, Lz70;->l:Ls7;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {v0, v1}, Ls7;->u(Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 20
    .line 21
    check-cast p0, Ljava/util/concurrent/CopyOnWriteArrayList;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/CopyOnWriteArrayList;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Lo70;

    .line 38
    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    .line 43
    .line 44
    :cond_1
    iget-object v0, v0, Lo70;->a:Lf80;

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_2
    return-void
.end method

.method public v()Ljava/util/List;
    .locals 1

    .line 1
    iget-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast v0, Ltl0;

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ltl0;

    .line 8
    .line 9
    invoke-direct {v0, p0}, Ltl0;-><init>(Ls7;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Ls7;->l:Ljava/lang/Object;

    .line 13
    .line 14
    :cond_0
    return-object v0
.end method

.method public w(Landroid/text/method/KeyListener;)Landroid/text/method/KeyListener;
    .locals 0

    .line 1
    instance-of p0, p1, Landroid/text/method/NumberKeyListener;

    .line 2
    .line 3
    if-nez p0, :cond_3

    .line 4
    .line 5
    instance-of p0, p1, Li00;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-object p1

    .line 10
    :cond_0
    if-nez p1, :cond_1

    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0

    .line 14
    :cond_1
    instance-of p0, p1, Landroid/text/method/NumberKeyListener;

    .line 15
    .line 16
    if-eqz p0, :cond_2

    .line 17
    .line 18
    return-object p1

    .line 19
    :cond_2
    new-instance p0, Li00;

    .line 20
    .line 21
    invoke-direct {p0, p1}, Li00;-><init>(Landroid/text/method/KeyListener;)V

    .line 22
    .line 23
    .line 24
    return-object p0

    .line 25
    :cond_3
    return-object p1
.end method

.method public y()V
    .locals 0

    .line 1
    iget-object p0, p0, Ls7;->k:Ljava/lang/Object;

    .line 2
    .line 3
    check-cast p0, Landroid/util/SparseIntArray;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/util/SparseIntArray;->clear()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public z(Landroid/util/AttributeSet;I)V
    .locals 8

    .line 1
    iget v0, p0, Ls7;->j:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const/4 v2, 0x0

    .line 5
    packed-switch v0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ls7;->k:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Landroid/widget/EditText;

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    sget-object v3, Lgx0;->i:[I

    .line 17
    .line 18
    invoke-virtual {v0, p1, v3, p2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    const/16 p2, 0xe

    .line 23
    .line 24
    :try_start_0
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 31
    .line 32
    .line 33
    move-result v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    :goto_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v1}, Ls7;->H(Z)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :goto_1
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 45
    .line 46
    .line 47
    throw p0

    .line 48
    :pswitch_0
    iget-object v0, p0, Ls7;->k:Ljava/lang/Object;

    .line 49
    .line 50
    check-cast v0, Landroid/widget/AbsSeekBar;

    .line 51
    .line 52
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    sget-object v4, Ls7;->m:[I

    .line 57
    .line 58
    invoke-static {v3, p1, v4, p2}, Lc9;->F(Landroid/content/Context;Landroid/util/AttributeSet;[II)Lc9;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    invoke-virtual {p1, v2}, Lc9;->u(I)Landroid/graphics/drawable/Drawable;

    .line 63
    .line 64
    .line 65
    move-result-object p2

    .line 66
    if-eqz p2, :cond_3

    .line 67
    .line 68
    instance-of v3, p2, Landroid/graphics/drawable/AnimationDrawable;

    .line 69
    .line 70
    if-eqz v3, :cond_2

    .line 71
    .line 72
    check-cast p2, Landroid/graphics/drawable/AnimationDrawable;

    .line 73
    .line 74
    invoke-virtual {p2}, Landroid/graphics/drawable/AnimationDrawable;->getNumberOfFrames()I

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    new-instance v4, Landroid/graphics/drawable/AnimationDrawable;

    .line 79
    .line 80
    invoke-direct {v4}, Landroid/graphics/drawable/AnimationDrawable;-><init>()V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p2}, Landroid/graphics/drawable/AnimationDrawable;->isOneShot()Z

    .line 84
    .line 85
    .line 86
    move-result v5

    .line 87
    invoke-virtual {v4, v5}, Landroid/graphics/drawable/AnimationDrawable;->setOneShot(Z)V

    .line 88
    .line 89
    .line 90
    move v5, v2

    .line 91
    :goto_2
    const/16 v6, 0x2710

    .line 92
    .line 93
    if-ge v5, v3, :cond_1

    .line 94
    .line 95
    invoke-virtual {p2, v5}, Landroid/graphics/drawable/AnimationDrawable;->getFrame(I)Landroid/graphics/drawable/Drawable;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    invoke-virtual {p0, v7, v1}, Ls7;->J(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    .line 100
    .line 101
    .line 102
    move-result-object v7

    .line 103
    invoke-virtual {v7, v6}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 104
    .line 105
    .line 106
    invoke-virtual {p2, v5}, Landroid/graphics/drawable/AnimationDrawable;->getDuration(I)I

    .line 107
    .line 108
    .line 109
    move-result v6

    .line 110
    invoke-virtual {v4, v7, v6}, Landroid/graphics/drawable/AnimationDrawable;->addFrame(Landroid/graphics/drawable/Drawable;I)V

    .line 111
    .line 112
    .line 113
    add-int/lit8 v5, v5, 0x1

    .line 114
    .line 115
    goto :goto_2

    .line 116
    :cond_1
    invoke-virtual {v4, v6}, Landroid/graphics/drawable/Drawable;->setLevel(I)Z

    .line 117
    .line 118
    .line 119
    move-object p2, v4

    .line 120
    :cond_2
    invoke-virtual {v0, p2}, Landroid/widget/ProgressBar;->setIndeterminateDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 121
    .line 122
    .line 123
    :cond_3
    invoke-virtual {p1, v1}, Lc9;->u(I)Landroid/graphics/drawable/Drawable;

    .line 124
    .line 125
    .line 126
    move-result-object p2

    .line 127
    if-eqz p2, :cond_4

    .line 128
    .line 129
    invoke-virtual {p0, p2, v2}, Ls7;->J(Landroid/graphics/drawable/Drawable;Z)Landroid/graphics/drawable/Drawable;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-virtual {v0, p0}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 134
    .line 135
    .line 136
    :cond_4
    invoke-virtual {p1}, Lc9;->H()V

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    nop

    .line 141
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method
