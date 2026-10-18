.class public final Lwb;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lir0;


# static fields
.field public static final a:Lwb;

.field public static final b:Lv20;

.field public static final c:Lv20;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lwb;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lwb;->a:Lwb;

    .line 7
    .line 8
    const-string v0, "rolloutId"

    .line 9
    .line 10
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lwb;->b:Lv20;

    .line 15
    .line 16
    const-string v0, "variantId"

    .line 17
    .line 18
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    sput-object v0, Lwb;->c:Lv20;

    .line 23
    .line 24
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 1

    .line 1
    check-cast p1, Lns;

    .line 2
    .line 3
    check-cast p2, Ljr0;

    .line 4
    .line 5
    move-object p0, p1

    .line 6
    check-cast p0, Lde;

    .line 7
    .line 8
    iget-object p0, p0, Lde;->a:Ljava/lang/String;

    .line 9
    .line 10
    sget-object v0, Lwb;->b:Lv20;

    .line 11
    .line 12
    invoke-interface {p2, v0, p0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 13
    .line 14
    .line 15
    check-cast p1, Lde;

    .line 16
    .line 17
    iget-object p0, p1, Lde;->b:Ljava/lang/String;

    .line 18
    .line 19
    sget-object p1, Lwb;->c:Lv20;

    .line 20
    .line 21
    invoke-interface {p2, p1, p0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 22
    .line 23
    .line 24
    return-void
.end method
