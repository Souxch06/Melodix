.class public final Lub;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"

# interfaces
.implements Lir0;


# static fields
.field public static final a:Lub;

.field public static final b:Lv20;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lub;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lub;->a:Lub;

    .line 7
    .line 8
    const-string v0, "content"

    .line 9
    .line 10
    invoke-static {v0}, Lv20;->a(Ljava/lang/String;)Lv20;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    sput-object v0, Lub;->b:Lv20;

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lms;

    .line 2
    .line 3
    check-cast p2, Ljr0;

    .line 4
    .line 5
    check-cast p1, Lae;

    .line 6
    .line 7
    iget-object p0, p1, Lae;->a:Ljava/lang/String;

    .line 8
    .line 9
    sget-object p1, Lub;->b:Lv20;

    .line 10
    .line 11
    invoke-interface {p2, p1, p0}, Ljr0;->a(Lv20;Ljava/lang/Object;)Ljr0;

    .line 12
    .line 13
    .line 14
    return-void
.end method
