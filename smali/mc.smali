.class public final Lmc;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lir0;


# static fields
.field public static final a:Lmc;

.field public static final b:Lv20;

.field public static final c:Lv20;

.field public static final d:Lv20;

.field public static final e:Lv20;

.field public static final f:Lv20;

.field public static final g:Lv20;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lmc;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lmc;->a:Lmc;

    .line 7
    .line 8
    const-string v0, "appId"

    .line 9
    .line 10
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lmc;->b:Lv20;

    .line 15
    .line 16
    const-string v0, "deviceModel"

    .line 17
    .line 18
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lmc;->c:Lv20;

    .line 23
    .line 24
    const-string v0, "sessionSdkVersion"

    .line 25
    .line 26
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lmc;->d:Lv20;

    .line 31
    .line 32
    const-string v0, "osVersion"

    .line 33
    .line 34
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    sput-object v0, Lmc;->e:Lv20;

    .line 39
    .line 40
    const-string v0, "logEnvironment"

    .line 41
    .line 42
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    sput-object v0, Lmc;->f:Lv20;

    .line 47
    .line 48
    const-string v0, "androidAppInfo"

    .line 49
    .line 50
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    sput-object v0, Lmc;->g:Lv20;

    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Lv9;

    .line 2
    .line 3
    check-cast p2, Ljr0;

    .line 4
    .line 5
    sget-object p0, Lmc;->b:Lv20;

    .line 6
    .line 7
    iget-object v0, p1, Lv9;->a:Ljava/lang/String;

    .line 8
    .line 9
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 10
    .line 11
    .line 12
    sget-object p0, Lmc;->c:Lv20;

    .line 13
    .line 14
    sget-object v0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 17
    .line 18
    .line 19
    sget-object p0, Lmc;->d:Lv20;

    .line 20
    .line 21
    const-string v0, "3.0.5"

    .line 22
    .line 23
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 24
    .line 25
    .line 26
    sget-object p0, Lmc;->e:Lv20;

    .line 27
    .line 28
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 29
    .line 30
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 31
    .line 32
    .line 33
    sget-object p0, Lmc;->f:Lv20;

    .line 34
    .line 35
    sget-object v0, Lik0;->k:Lik0;

    .line 36
    .line 37
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 38
    .line 39
    .line 40
    sget-object p0, Lmc;->g:Lv20;

    .line 41
    .line 42
    iget-object p1, p1, Lv9;->b:Ly4;

    .line 43
    .line 44
    invoke-interface {p2, p0, p1}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 45
    .line 46
    .line 47
    return-void
.end method
