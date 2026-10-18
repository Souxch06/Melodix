.class public final Lnc;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lir0;


# static fields
.field public static final a:Lnc;

.field public static final b:Lv20;

.field public static final c:Lv20;

.field public static final d:Lv20;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lnc;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lnc;->a:Lnc;

    .line 7
    .line 8
    const-string v0, "performance"

    .line 9
    .line 10
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lnc;->b:Lv20;

    .line 15
    .line 16
    const-string v0, "crashlytics"

    .line 17
    .line 18
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lnc;->c:Lv20;

    .line 23
    .line 24
    const-string v0, "sessionSamplingRate"

    .line 25
    .line 26
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    sput-object v0, Lnc;->d:Lv20;

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 2

    .line 1
    check-cast p1, Lut;

    .line 2
    .line 3
    check-cast p2, Ljr0;

    .line 4
    .line 5
    sget-object p0, Lnc;->b:Lv20;

    .line 6
    .line 7
    iget-object v0, p1, Lut;->a:Ltt;

    .line 8
    .line 9
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 10
    .line 11
    .line 12
    sget-object p0, Lnc;->c:Lv20;

    .line 13
    .line 14
    iget-object v0, p1, Lut;->b:Ltt;

    .line 15
    .line 16
    invoke-interface {p2, p0, v0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 17
    .line 18
    .line 19
    sget-object p0, Lnc;->d:Lv20;

    .line 20
    .line 21
    iget-wide v0, p1, Lut;->c:D

    .line 22
    .line 23
    invoke-interface {p2, p0, v0, v1}, Ljr0;->f(Lv20;D)Ljr0;

    .line 24
    .line 25
    .line 26
    return-void
.end method
