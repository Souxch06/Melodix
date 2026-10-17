.class public final Luj;
.super Ljava/lang/Object;
.source "r8-map-id-37e276fb91e34a5f1b4d8f51e71abe3719dc52e9eeab3bd3e0cf2cd8d4f7becf"


# static fields
.field public static final c:Luj;


# instance fields
.field public final a:Laa;

.field public b:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Luj;

    .line 2
    .line 3
    invoke-direct {v0}, Luj;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Luj;->c:Luj;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Laa;

    .line 5
    .line 6
    invoke-direct {v0}, Laa;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Luj;->a:Laa;

    .line 10
    .line 11
    return-void
.end method
