.class public abstract Lpv1;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Ljava/lang/reflect/Method;

.field public static final b:Ljava/lang/reflect/Method;


# direct methods
.method static constructor <clinit>()V
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    const-class v1, Landroid/app/job/JobScheduler;

    .line 3
    .line 4
    const-string v2, "scheduleAsPackage"

    .line 5
    .line 6
    const/4 v3, 0x4

    .line 7
    new-array v3, v3, [Ljava/lang/Class;

    .line 8
    .line 9
    const-class v4, Landroid/app/job/JobInfo;

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    aput-object v4, v3, v5

    .line 13
    .line 14
    const-class v4, Ljava/lang/String;

    .line 15
    .line 16
    const/4 v5, 0x1

    .line 17
    aput-object v4, v3, v5

    .line 18
    .line 19
    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 20
    .line 21
    const/4 v6, 0x2

    .line 22
    aput-object v5, v3, v6

    .line 23
    .line 24
    const/4 v5, 0x3

    .line 25
    aput-object v4, v3, v5

    .line 26
    .line 27
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 28
    .line 29
    .line 30
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    goto :goto_0

    .line 32
    :catch_0
    move-object v1, v0

    .line 33
    :goto_0
    sput-object v1, Lpv1;->a:Ljava/lang/reflect/Method;

    .line 34
    .line 35
    :try_start_1
    const-class v1, Landroid/os/UserHandle;

    .line 36
    .line 37
    const-string v2, "myUserId"

    .line 38
    .line 39
    invoke-virtual {v1, v2, v0}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 40
    .line 41
    .line 42
    move-result-object v0
    :try_end_1
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1} :catch_1

    .line 43
    :catch_1
    sput-object v0, Lpv1;->b:Ljava/lang/reflect/Method;

    .line 44
    .line 45
    return-void
.end method
