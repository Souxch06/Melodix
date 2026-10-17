.class public abstract Lru0;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final a:Lll0;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    sget-object v0, Lwk1;->l:Lok1;

    .line 2
    .line 3
    sget-object v1, Lwk1;->n:Lsk1;

    .line 4
    .line 5
    invoke-static {}, Lwu0;->n()Lwu0;

    .line 6
    .line 7
    .line 8
    move-result-object v2

    .line 9
    new-instance v3, Lll0;

    .line 10
    .line 11
    invoke-direct {v3, v0, v1, v2}, Lll0;-><init>(Lwk1;Lwk1;Lwu0;)V

    .line 12
    .line 13
    .line 14
    sput-object v3, Lru0;->a:Lll0;

    .line 15
    .line 16
    return-void
.end method
